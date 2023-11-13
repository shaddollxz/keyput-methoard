#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"
#Include "../utils/assert.ahk"

mode_caps := useMode("CapsLock", keyMap.onlyCaps)

*CapsLock:: {
    mode_caps.openMode()
    Send("{Alt Up}")
}

#HotIf mode_caps.isOpenMode
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

; 打开桌面控制台
*Tab:: {
    Send(keyMap.win . keyMap.onlyTab)
}

*Space:: {
    Send("{Alt Down}")
    Send(keyMap.onlyTab)
}

; 浏览器或者代码编辑器中，切换标签页
; 向左
*e::
*i:: {
    Send(keyMap.ctrl . keyMap.onlyPageUp)
}
; 向右
*d::
*k:: {
    Send(keyMap.ctrl . keyMap.onlyPageDown)
}

; 关闭标签页 另一个快捷键是 alt + q
*c:: {
    Send(keyMap.ctrl . "w")
}

*v:: {
    if (isBrowser()) {
        Send("{F5}")
    }
}
*z:: {
    if (isBrowser()) {
        Send(keyMap.alt . keyMap.onlyRight)
    }
}
*x:: {
    if (isBrowser()) {
        Send(keyMap.alt . keyMap.onlyLeft)
    }
}

; 切换应用
; 上一个运行窗口
*j:: {
    Send(keyMap.alt . keyMap.shift . keyMap.onlyEsc)
}
; 下一个运行窗口
*l:: {
    Send(keyMap.alt . keyMap.onlyEsc)
}

; 切换桌面
; 向左
*s:: {
    Send(keyMap.ctrl . keyMap.win . keyMap.onlyLeft)
}
; 向右
*f:: {
    Send(keyMap.ctrl . keyMap.win . keyMap.onlyRight)
}
#HotIf