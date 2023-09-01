#Include "../configs/key-map.ahk"
#Include "../utils/get-change-tab-type.ahk"
#Include "../utils/use-mode.ahk"

modeData_caps := useMode("CapsLock", keyMap.onlyCaps)

*CapsLock:: {
    modeData_caps.openMode()
}

#HotIf modeData_caps.isOpenMode
; 打开浏览器开发者模式
*w:: {
    Send(keyMap.ctrl . keyMap.shift . "i")
}

; 最大化模式下最小化 非最大化模式下最大化
*q:: {
    if (WinGetMinMax("A") > 0) {
        WinRestore("A")
    } else {
        WinMaximize("A")
    }
}

; 浏览器或者代码编辑器中，切换标签页
; 向左
*e::
*i:: {
    changeType := getChangeTabType()

    switch changeType {
        case "ctrl":
            Send(keyMap.ctrl . keyMap.shift . keyMap.onlyTab)

        case "dn":
            Send(keyMap.ctrl . keyMap.onlyPageUp)
    }
}
; 向右
*f::
*k:: {
    changeType := getChangeTabType()

    switch changeType {
        case "ctrl":
            Send(keyMap.ctrl . keyMap.onlyTab)

        case "dn":
            Send(keyMap.ctrl . keyMap.onlyPageDown)
    }
}

; 关闭标签页 另一个快捷键是 alt + q
*c:: {
    Send(keyMap.ctrl . "w")
}

; todo 切换窗口
; 向左
; *j:: {
; }
; 向右
; *l:: {
; }

; 切换桌面
; 向左
*s:: {
    Send("{LControl down}{LWin down}{Left}{LWin up}{LControl up}")
}
; 向右
*d:: {
    Send("{LControl down}{LWin down}{Right}{LWin up}{LControl up}")
}
#HotIf