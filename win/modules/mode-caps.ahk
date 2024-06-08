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
*e:: {
    if (isVscode()) {
        Send(keyMap.ctrl . keyMap.onlyPageUp)
    } else {
        Send(keyMap.ctrl . keyMap.shift . keyMap.onlyTab)
    }
}
; 向右
*d:: {
    ; FIXME: google 考虑一下
    if (isVscode()) {
        Send(keyMap.ctrl . keyMap.onlyPageDown)
    } else {
        Send(keyMap.ctrl . keyMap.onlyTab)
    }
}

; 关闭标签页 另一个快捷键是 alt + q
*c:: {
    Send(keyMap.ctrl . "w")
}
; 新增标签页
*t:: {
    Send(keyMap.ctrl . "t")
}
; 恢复上一个关闭的标签页
*b:: {
    Send(keyMap.ctrl . keyMap.shift . "t")
}
; 刷新标签页
*v:: {
    if (isBrowser()) {
        Send("{F5}")
    }
}

; 前进
*z:: {
    Send(keyMap.alt . keyMap.onlyRight)
}
; 后退
*x:: {
    Send(keyMap.alt . keyMap.onlyLeft)
}

; vscode 切换分栏
*j:: {
    if (isVscode()) {
        Send(keyMap.ctrl . "k")
        Send(keyMap.ctrl . keyMap.onlyLeft)
    }
}
*l:: {
    if (isVscode()) {
        Send(keyMap.ctrl . "k")
        Send(keyMap.ctrl . keyMap.onlyRight)
    }
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
; 删除当前桌面
*a:: {
    Send(keyMap.ctrl . keyMap.win . "{F4}")
}
; 新增桌面
*g:: {
    Send(keyMap.ctrl . keyMap.win . "d")
}
; 显示桌面
*LAlt:: {
    Send(keyMap.win . "d")
}

; 截屏
*`:: {
    Send(keyMap.win . keyMap.shift . "s")
}
#HotIf
