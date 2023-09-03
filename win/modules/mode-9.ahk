#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

SUB_MODE_SPACE := "Space"
SUB_MODE_I := "i"

mode_9 := useMode("9")
mode_9.addSubMode(SUB_MODE_SPACE)
mode_9.addSubMode(SUB_MODE_I)


*9:: {
    mode_9.openMode()
}

; 对应模式下的映射
#HotIf (mode_9.isOpenMode)
*Space:: {
    mode_9.switchSubMode(SUB_MODE_SPACE)
}
*i:: {
    mode_9.switchSubMode(SUB_MODE_I)
}

*w:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyUp)
    } else {
        Send(keyMap.up)
    }
}
*s:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyDown)
    } else {
        Send(keyMap.down)
    }
}
*a:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyLeft)
    } else {
        Send(keyMap.left)
    }
}
*f:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyRight)
    } else {
        Send(keyMap.right)
    }
}
*g:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyEnd)
    } else {
        Send(keyMap.end)
    }
}
*q:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyHome)
    } else {
        Send(keyMap.home)
    }
}
*e:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyPreviousWord)
    } else {
        Send(keyMap.previousWord)
    }
}
*d:: {
    if (mode_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyNextWord)
    } else {
        Send(keyMap.nextWord)
    }
}
*u:: {
    if (mode_9.isOpenSubMode(SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyBackspace)
    } else {
        Send(keyMap.backspace)
    }
}
*p:: {
    if (mode_9.isOpenSubMode(SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyDelete)
    } else {
        Send(keyMap.delete)
    }
}
#HotIf