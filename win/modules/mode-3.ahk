#Include "../configs/key-map.ahk"
#Include "../utils/assert.ahk"
#Include "../utils/use-mode.ahk"

MODE_3_SUB_MODE_SPACE := "Space"

mode_3 := useMode("3")
mode_3.addSubMode(MODE_3_SUB_MODE_SPACE, "hover")

*3:: {
    mode_3.openMode()
}

; 对应模式下的映射
#HotIf (mode_3.isOpenMode)
*n:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        if (isVscode()) {
            Send(keyMap.ctrl . keyMap.shift . "F5")
        } else if (isBrowser()) {
            Send(keyMap.ctrl . "r")
        }
    } else {
        Send("1")
    }
}
*m:: {
    Send("2")
}
*,::
*.:: {
    Send("3")
}
*h:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        Send("F9")
    } else {
        Send("0")
    }
}
*j:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        Send(keyMap.shift . "F11")
    } else {
        Send("4")
    }
}
*k:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        Send("F11")
    } else {
        Send("5")
    }
}
*l:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        Send("F10")
    } else {
        Send("6")
    }
}
*u:: {
    Send("7")
}
*i:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        if (isVscode()) {
            Send("F6")
        } else if (isBrowser()) {
            Send("F8")
        }
    } else {
        Send("8")
    }
}
*o:: {
    Send("8")
}
*p:: {
    if (mode_3.isOpenSubMode(MODE_3_SUB_MODE_SPACE)) {
        if (isVscode()) {
            Send(keyMap.shift . "F5")
        } else if (isBrowser()) {
            Send("F8")
        }
    } else {
        Send("9")
    }
}

*r:: {
    Send(keyMap.delete)
}
*q:: {
    Send(keyMap.backspace)
}
#HotIf
