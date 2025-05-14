import Cocoa
import Utils

if NSScreen.screens.count < 2 {
    exit(0)
}

// 1.获得当然激活的 app 信息
var appInfo = try getActiveApplicationWindowInfo().get()

// 2.获得所有屏幕信息
let screens: [NSRect] = NSScreen.screens.map { $0.frame }

// 3.获得当前激活 app 所在屏幕信息
guard
    let currentScreenIndex: Array<NSRect>.Index = screens.firstIndex(where: {
        (screen: NSRect) -> Bool in
        // FIXME: 根据 app 的大小和坐标判断，现在 app 的左上角在第一屏中，但是大部分在第二屏会判断出问题
        return appInfo.isFullScreen
            ? screen.width == appInfo.rect.width
            : screen.contains(NSPoint(x: appInfo.rect.minX, y: appInfo.rect.minY))
    })
else {
    print("not get current screen index")
    exit(1)
}
let currentScreen = screens[currentScreenIndex]

// 4.如果当前 app 是全屏的，则缩小它（使用模拟快捷键实现）
if appInfo.isFullScreen {
    _ = runAppleScript(
        source: """
            tell application "System Events"
              keystroke "f" using {control down, command down}
              delay 0.8
            end tell
            """
    )

    // 再重新获得应用信息
    appInfo = try getActiveApplicationWindowInfo().get()
}

// 5.获得下一个屏幕的信息
let nextScreenIndex = currentScreenIndex + 1 == screens.endIndex ? 0 : currentScreenIndex + 1
let nextScreen = screens[nextScreenIndex]

// 6.计算在下一个屏幕的位置
let newPosition: NSPoint = NSPoint(
    x: nextScreen.minX
        + ((appInfo.rect.minX - currentScreen.minX) / currentScreen.width * nextScreen.width),
    y: nextScreen.minY + (appInfo.rect.minY / currentScreen.height * nextScreen.height)
)

// 7.移动 app 到下一个屏幕
_ = runAppleScript(
    source: """
        tell application "System Events"
          tell process "\(appInfo.name)"
            set position of front window to {\(newPosition.x), \(newPosition.y)}
          end tell
        end tell
        """)
