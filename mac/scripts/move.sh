# 获得当前屏幕数据（处理成数组，数组顺序就是设置的屏幕顺序）
# 屏幕大小优先使用 “UI Looks like” 中的像素，如果没有则使用 Resolution(如果带有 Retina 需要把像素缩为一半)
displayWidths=();
i=0;

displayInfo=$(system_profiler SPDisplaysDataType | grep -E "Resolution|UI Looks like");

while IFS= read line; do
  # 分割 key 和 value
  IFS=':' read -r key value <<< "$line";
  key=$(echo "$key" | xargs);       # 去掉 key 的首尾空格
  value=$(echo "$value" | xargs);   # 去掉 value 的首尾空格

  # $3 是 height
  read width <<< $(echo "$value" | awk '{print $1}');

  if [[ "$value" == *"Retina" ]]; then
    width=$((width / 2));
  fi;

  if [[ "$key" == 'Resolution' ]]; then
    displayWidths[$i]=$width;
    ((i++));
  else
    displayWidths[$(($i - 1))]=$width;
  fi;
done <<< "$displayInfo";

# 如果只有一个屏幕，不继续执行
displayCount=${#displayWidths[@]};

if (($displayCount < 2)); then
    exit 0;
fi;

# 获得当前应用的名字
frontApp=$(lsappinfo info -only name "$(lsappinfo front)" | awk -F'"' '{print $4}');

# 如果是全屏的，把它缩小
isFullscreen=$(echo "
tell application \"System Events\" \n
    tell process \"$frontApp\" \n
        set fullscreenButton to value of attribute \"AXFullScreenButton\" of front window \n
        if fullscreenButton is missing value then \n
            return true \n
        else \n
            return false \n
        end if \n
    end tell \n
end tell" | osascript);
if [ $isFullscreen == true ]; then
  echo '
tell application "System Events" \n
  keystroke "f" using {control down, command down} \n
  delay 0.4 \n
end tell' | osascript;
fi;

# 当前应用的大小和位置信息
appState=$(echo "
tell application \"System Events\" \n
  tell process \"$frontApp\" \n
    set {w, h} to size of front window \n
    set {x, y} to position of front window \n
    return \"[\" & w & \",\" & h & \",\" & x & \",\" & y & \"]\" \n
  end tell \n
end tell" | osascript | tr -d '[]');

IFS=',' read -r windowWidth windowHeight windowX windowY <<<"$appState";

# 计算当前应用所在的屏幕的 index
appScreenIndex=0;

for ((i=0, currentSum=0; i < $displayCount; currentSum+=displayWidths[i], i++)); do
    nextSum=$((currentSum + displayWidths[i]));

    if (( $windowX >= $currentSum )) && (( $windowX < $nextSum )); then
        appScreenIndex=$i;
        break;
    fi;
done;

# 计算下一个屏幕的 index
nextScreenIndex=$(((appScreenIndex + 1) % displayCount));

currentScreenWidth=${displayWidths[$appScreenIndex]};
nextScreenWidth=${displayWidths[$nextScreenIndex]};

# 计算将要移动到的位置
previousScreensWidth=0;
for ((i = 0; i < $appScreenIndex; i++)); do
    previousScreensWidth=$((previousScreensWidth + displayWidths[i]));
done;

# 应用在当前屏幕的相对 x 位置，用它计算移动到屏幕的位置
relativeX=$((windowX - previousScreensWidth));
currentScreenMovePixelX=$((currentScreenWidth - relativeX));

newPositionX=0;
nextScreenMovePixelX=$(($relativeX * $nextScreenWidth / $currentScreenWidth));

if (($nextScreenIndex < $appScreenIndex)); then
  newPositionX=$nextScreenMovePixelX;
else
  movePixelX=$(($currentScreenMovePixelX + $nextScreenMovePixelX));
  newPositionX=$(($windowX + $movePixelX));
fi;

# 移动窗口
echo "
tell application \"System Events\" \n
  tell process \"$frontApp\" \n
    set position of front window to {$newPositionX, $windowY} \n
  end tell \n
end tell" | osascript;

echo "
tell application \"$frontApp\" to activate \n
delay 0.3 \n
tell application \"$frontApp\" to activate" | osascript;
