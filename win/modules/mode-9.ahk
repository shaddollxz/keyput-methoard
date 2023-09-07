#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

MODE_9_SUB_MODE_SPACE := "Space"
MODE_9_SUB_MODE_I := "i"
MODE_9_SUB_MODE_CAPS := "CapsLock"

mode_9 := useMode("9")
mode_9.addSubMode(MODE_9_SUB_MODE_SPACE, "click")
mode_9.addSubMode(MODE_9_SUB_MODE_I, "click")
mode_9.addSubMode(MODE_9_SUB_MODE_CAPS, "hover")


*9:: {
    mode_9.openMode()
}

; 对应模式下的映射
#HotIf (mode_9.isOpenMode)
*Space:: {
    mode_9.switchSubMode(MODE_9_SUB_MODE_SPACE)
}
*i:: {
    mode_9.switchSubMode(MODE_9_SUB_MODE_I)
}
*CapsLock:: {
    mode_9.switchSubMode(MODE_9_SUB_MODE_CAPS)
}

*w:: {
    isOpenCapsMode := mode_9.isOpenSubMode(MODE_9_SUB_MODE_CAPS)

    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        if (isOpenCapsMode) {
            return Send(keyMap.shift . keyMap.alt . keyMap.onlyUp)
        }
        return Send(keyMap.shift . keyMap.onlyUp)
    } else {
        if (isOpenCapsMode) {
            return Send(keyMap.alt . keyMap.onlyUp)
        }
        return Send(keyMap.up)
    }
}
*s:: {
    isOpenCapsMode := mode_9.isOpenSubMode(MODE_9_SUB_MODE_CAPS)

    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        if (isOpenCapsMode) {
            return Send(keyMap.shift . keyMap.alt . keyMap.onlyDown)
        }
        return Send(keyMap.shift . keyMap.onlyDown)
    } else {
        if (isOpenCapsMode) {
            return Send(keyMap.alt . keyMap.onlyDown)
        }
        return Send(keyMap.down)
    }
}
*a:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyLeft)
    } else {
        Send(keyMap.left)
    }
}
*f:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyRight)
    } else {
        Send(keyMap.right)
    }
}
*g:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyEnd)
    } else {
        Send(keyMap.end)
    }
}
*q:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyHome)
    } else {
        Send(keyMap.home)
    }
}
*e:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyPreviousWord)
    } else {
        Send(keyMap.previousWord)
    }
}
*d:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyNextWord)
    } else {
        Send(keyMap.nextWord)
    }
}

*u:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyBackspace)
    } else {
        Send(keyMap.backspace)
    }
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
*p:: {
    if (mode_9.isOpenSubMode(MODE_9_SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyDelete)
    } else {
        Send(keyMap.delete)
    }
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}

*z:: {
    Send(keyMap.ctrl . "z")
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
*x:: {
    Send(keyMap.ctrl . "x")
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
*c:: {
    Send(keyMap.ctrl . "c")
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
*v:: {
    Send(keyMap.ctrl . "v")
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
*y:: {
    Send(keyMap.ctrl . "s")
    mode_9.closeSubMode(MODE_9_SUB_MODE_SPACE)
}
#HotIf