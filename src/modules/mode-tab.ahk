#Include "../configs/key-map.ahk"
#Include "../utils/get-change-tab-type.ahk"
#Include "../utils/use-mode.ahk"

modeData_tab := useMode("Tab", keyMap.onlyTab)

*Tab:: {
    modeData_tab.openMode()
}

#HotIf modeData_tab.isOpenMode
; 最大化模式下最小化 非最大化模式下最大化
*q:: {
    if (WinGetMinMax("A") > 0) {
        WinRestore("A")
    } else {
        WinMaximize("A")
    }
}

; 打开浏览器开发者模式
*w:: {
    Send(keyMap.ctrl . keyMap.shift . "i")
}

; 浏览器或者代码编辑器中，切换标签页
; 双手时
; 向左
*2::
*j:: {
    changeType := getChangeTabType()

    switch changeType {
        case "ctrl":
            Send(keyMap.ctrl . keyMap.shift . keyMap.onlyTab)

        case "dn":
            Send(keyMap.ctrl . keyMap.onlyPageUp)
    }
}
; 向右
*e::
*l:: {
    changeType := getChangeTabType()

    switch changeType {
        case "ctrl":
            Send(keyMap.ctrl . keyMap.onlyTab)

        case "dn":
            Send(keyMap.ctrl . keyMap.onlyPageDown)
    }
}

; 关闭标签页
*r::
*p:: {
    Send(keyMap.ctrl . "w")
}

; todo 切换窗口
; 向左
; *1::
; *i:: {
; }
; 向右
; *r::
; *k:: {
; }

; 切换桌面
; 向左
*s::
*h:: {
    Send("{LControl down}{LWin down}{Left}{LWin up}{LControl up}")
}
; 向右
*d::
*`;:: {
    Send("{LControl down}{LWin down}{Right}{LWin up}{LControl up}")
}
#HotIf