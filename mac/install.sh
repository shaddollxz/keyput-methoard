if [ $(which goku) == "goku no found" ]; then
    echo "install goku and re-run this script"
    open https://github.com/yqrashawn/GokuRakuJoudo
    exit
fi

launchctl unload "$HOME"/Library/LaunchAgents/com.github.shaddollxz.keyput-methoard.screen-info-cache-updater.plist
cp com.github.shaddollxz.keyput-methoard.screen-info-cache-updater.plist "$HOME"/Library/LaunchAgents
chmod 644 "$HOME"/Library/LaunchAgents/com.github.shaddollxz.keyput-methoard.screen-info-cache-updater.plist
launchctl load "$HOME"/Library/LaunchAgents/com.github.shaddollxz.keyput-methoard.screen-info-cache-updater.plist

cp karabiner.edn "$HOME"/.config
rm -rf "$HOME"/.config/keyput-methoard-scripts
cp -r keyput-methoard-scripts "$HOME/.config"
chmod +x "$HOME"/.config/keyput-methoard-scripts/*.sh

goku

open https://github.com/shaddollxz/keyput-methoard
