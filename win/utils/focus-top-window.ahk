#Include "./point-in-rect.ahk"

focusTopWindow(rect) {
    ;; 获得系统应用外的所有应用 id 列表
    processIdList := WinGetList(, , "Program Manager")

    topAppIdIndex := 1
    for index, id in processIdList {
        WinGetClientPos(&x, &y, &width, &height, id)

        ;; 有些没有 title 的窗口，一般都是无法看到的，忽略这些
        winTitle := WinGetTitle(id)
        if winTitle {
            ; OutputDebug("id: " . id)
            ; OutputDebug("`n")
            ; OutputDebug("title: " . winTitle)
            ; OutputDebug("`n")
            ; OutputDebug("x: " . x . " y: " . y . " width: " . width . " height: " . height)
            ; OutputDebug("`n")

            ;; WinGetList 得到的列表已经按照激活顺序排列了，这里只需要找到在指定范围内的窗口即可
            if (pointInRect({ x: x, y: y }, rect)) {
                topAppIdIndex := index

                ; OutputDebug("this is top: " . winTitle)
                ; OutputDebug("`n")

                break
            }
        }
    }

    try {
        WinActivate(processIdList[topAppIdIndex])
    }
}
