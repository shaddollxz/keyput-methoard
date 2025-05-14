import AppKit
import Carbon
import Cocoa

public struct WindowMessage {
    public let rect: CGRect
    public let name: String
    public let pid: pid_t
    public let isFullScreen: Bool
}

public enum ApplicationErrors: Error, LocalizedError {
    case cantGetAppInfo

    public var errorDescription: String? {
        switch self {
        case .cantGetAppInfo:
            return "cant get current active application info"
        }
    }
}

public func getActiveApplicationWindowInfo() -> Result<WindowMessage, Error> {
    // 1. 获取前台应用
    guard let frontApp = NSWorkspace.shared.frontmostApplication else {
        return .failure(ApplicationErrors.cantGetAppInfo)
    }

    let appName = frontApp.localizedName ?? "Unknown"
    let processId = frontApp.processIdentifier

    // 2. 使用 Accessibility API 获取窗口信息
    let appElement = AXUIElementCreateApplication(processId)
    var value: AnyObject?

    // 获取主窗口
    if AXUIElementCopyAttributeValue(appElement, kAXMainWindowAttribute as CFString, &value)
        == .success
    {
        if let window = value as! AXUIElement? {
            // 获取窗口位置
            var positionValue: AnyObject?
            var windowPosition = CGPoint.zero
            if AXUIElementCopyAttributeValue(
                window, kAXPositionAttribute as CFString, &positionValue) == .success
            {
                if let position = positionValue as! AXValue?,
                    AXValueGetType(position) == .cgPoint
                {
                    AXValueGetValue(position, AXValueGetType(position), &windowPosition)
                }
            }

            // 获取窗口大小
            var sizeValue: AnyObject?
            var windowSize = CGSize.zero
            if AXUIElementCopyAttributeValue(window, kAXSizeAttribute as CFString, &sizeValue)
                == .success
            {
                if let size = sizeValue as! AXValue?,
                    AXValueGetType(size) == .cgSize
                {
                    AXValueGetValue(size, AXValueGetType(size), &windowSize)
                }
            }

            do {
                let isFullScreen = try runAppleScript(
                    // 通过菜单栏有没有缩小按钮来判断应用是否全屏幕
                    source: """
                        tell application "System Events"
                            tell process "\(appName)"
                                set fullscreenButton to value of attribute "AXMinimizeButton" of front window
                                if fullscreenButton is missing value then
                                    return true
                                else
                                    return false
                                end if
                            end tell
                        end tell
                        """
                ).get().booleanValue

                return .success(
                    WindowMessage(
                        rect: CGRect(
                            x: windowPosition.x,
                            y: windowPosition.y,
                            width: windowSize.width,
                            height: windowSize.height
                        ),
                        name: appName,
                        pid: processId,
                        isFullScreen: isFullScreen
                    )
                )
            } catch _ {
                return .failure(ApplicationErrors.cantGetAppInfo)
            }

        }
    }

    return .failure(ApplicationErrors.cantGetAppInfo)
}
