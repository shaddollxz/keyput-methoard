import Cocoa

public enum MouseErrors: Error, LocalizedError {
    case noNextScreen
    case cantGetWindowInfos
    case cantGetMousePointApp
    case cantGetCurrentScreenIndex

    public var errorDescription: String? {
        switch self {
        case .noNextScreen:
            return "no next or prev screen"
        case .cantGetCurrentScreenIndex:
            return "cant get current active screen index"
        case .cantGetMousePointApp:
            return "cant get current mouse point to app"
        case .cantGetWindowInfos:
            return "cant get current windows display apps info"
        }
    }
}

public func moveMouseToRelativeScreen(screenNumber: Int) -> Result<NSRect, MouseErrors> {
    // 1.获得所有屏幕大小信息和鼠标位置信息
    let screens: [NSRect] = NSScreen.screens.map { $0.frame }
    let mouse: NSPoint = NSEvent.mouseLocation

    // 2.计算当前鼠标所在屏幕（如果鼠标在最后一个屏幕，则停止后续操作）
    guard
        let currentScreenIndex: Array<NSRect>.Index = screens.firstIndex(where: {
            (screen: NSRect) -> Bool in
            return screen.contains(mouse)
        })
    else {
        return .failure(MouseErrors.cantGetCurrentScreenIndex)
    }

    let nextScreenIndex = currentScreenIndex + screenNumber

    if nextScreenIndex < 0 || nextScreenIndex > screens.endIndex {
        return .failure(MouseErrors.noNextScreen)
    }

    // 3.计算鼠标移动后的位置
    let currentScreen: NSRect = screens[currentScreenIndex]
    let nextScreen: NSRect = screens[nextScreenIndex]

    let newPosition: NSPoint = NSPoint(
        x: nextScreen.minX
            + ((mouse.x - currentScreen.minX) / currentScreen.width * nextScreen.width),
        // mac 跨屏幕移动的时候坐标轴不是按照下一屏的坐标轴计算的，这里用 maxY - 移动的距离可以得到需要到的位置
        y: nextScreen.maxY - (mouse.y / currentScreen.height * nextScreen.height)
    )

    // 4.移动鼠标到指定位置
    let event = CGEvent(
        mouseEventSource: nil,
        mouseType: .mouseMoved,
        mouseCursorPosition: newPosition,
        mouseButton: .left
    )
    event?.post(tap: .cghidEventTap)  // 发送事件到系统

    return .success(nextScreen)
}

public func focusScreenTopApp(_ screen: NSRect) -> Result<Void, MouseErrors> {
    // 获取窗口列表（仅屏幕上可见的窗口）
    let options = CGWindowListOption(arrayLiteral: .optionOnScreenOnly, .excludeDesktopElements)
    guard
        let windowInfos = CGWindowListCopyWindowInfo(options, kCGNullWindowID) as? [[String: Any]]
    else { return .failure(MouseErrors.cantGetWindowInfos) }

    var pointAppPid: pid_t? = nil
    for info in windowInfos {
        guard
            let windowBounds = info[kCGWindowBounds as String] as? [String: CGFloat],
            let appPid = info[kCGWindowOwnerPID as String] as? pid_t,
            let layer = info[kCGWindowLayer as String] as? Int
        else {
            continue
        }

        let windowRect = CGRect(
            x: windowBounds["X"]!,
            y: windowBounds["Y"]!,
            width: windowBounds["Width"]!,
            height: windowBounds["Height"]!
        )

        print("info: \(info)")

        if layer == 0
            // 有些应用全屏模式下 y 轴坐标比屏幕的还要大，这里优先判断大小匹配上
            && ((screen.width == windowRect.width && screen.height == windowRect.height)
                || screen.contains(windowRect))
        {
            pointAppPid = appPid
            break
        }
    }

    // 6.焦距指向的 app
    guard
        let pid: pid_t = pointAppPid,
        let app: NSRunningApplication = NSRunningApplication(processIdentifier: pid)
    else { return .failure(MouseErrors.cantGetMousePointApp) }

    app.activate()

    return .success(())
}
