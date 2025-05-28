#Include "./point-in-rect.ahk"
#Include "./array.ahk"

moveMouse(to) {
    ;; 获得屏幕数量
    screenCount := MonitorGetCount()

    if screenCount < 2 {
        return
    }

    ;; 获得每一个屏幕的信息
    screens := []
    loop (screenCount) {
        MonitorGet(A_Index, &left, &top, &right, &bottom)

        ; OutputDebug("index: " . A_Index . " left: " . left . " top: " . top . " right: " . right . " bottom: " . bottom)
        ; OutputDebug("`n")

        screens.Push({
            x: left,
            y: top,
            width: right - left,
            height: bottom - top,
            minX: left,
            maxX: right,
            minY: top,
            maxY: bottom
        })
    }

    ;; 默认按照 windows 设置的屏幕序号排序，将它改成按照 x 坐标从左到右排序
    sort(screens, (a, b) => a.x - b.x)

    ;; 获得当前鼠标位置
    MouseGetPos(&mouseX, &mouseY)
    mousePos := {
        x: mouseX,
        y: mouseY
    }

    ; OutputDebug("mouse x: " . mousePos.x . " y: " . mousePos.y)
    ; OutputDebug("`n")

    ;; 当前鼠标所在屏幕
    currentScreenIndex := 1

    for (index, screen in screens) {
        if pointInRect(mousePos, screen) {
            currentScreenIndex := index

            break
        }
    }

    ; OutputDebug("currentScreenIndex: " . currentScreenIndex)
    ; OutputDebug("`n")

    ;; 没有将要移动的屏幕则提前结束
    nextScreenIndex := currentScreenIndex + to
    if (nextScreenIndex < 1 || nextScreenIndex > screenCount) {
        return
    }

    ; OutputDebug("nextScreenIndex: " . nextScreenIndex)
    ; OutputDebug("`n")

    currentScreen := screens[currentScreenIndex]
    nextScreen := screens[nextScreenIndex]

    newMousePos := {
        x: nextScreen.minX + (mousePos.x - currentScreen.minX) / currentScreen.width * nextScreen.width,
        y: nextScreen.minY + (mousePos.y - currentScreen.minY) / currentScreen.height * nextScreen.height
    }

    ; OutputDebug("new mousePos: x: " . newMousePos.x . " y: " . newMousePos.y)
    ; OutputDebug("`n")

    ;; 移动鼠标
    MouseMove(newMousePos.x, newMousePos.y)

    return nextScreen
}
