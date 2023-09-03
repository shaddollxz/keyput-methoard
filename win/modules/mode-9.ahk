#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

SUB_MODE_SPACE := "Space"
SUB_MODE_I := "i"

modeData_9 := useMode("9")
modeData_9.addSubMode(SUB_MODE_SPACE)
modeData_9.addSubMode(SUB_MODE_I)


*9:: {
    modeData_9.openMode()
}

; 对应模式下的映射
#HotIf (modeData_9.isOpenMode)
*Space:: {
    modeData_9.switchSubMode(SUB_MODE_SPACE)
}
*i:: {
    modeData_9.switchSubMode(SUB_MODE_I)
}

*w:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyUp)
    } else {
        Send(keyMap.up)
    }
}
*s:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyDown)
    } else {
        Send(keyMap.down)
    }
}
*a:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyLeft)
    } else {
        Send(keyMap.left)
    }
}
*f:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyRight)
    } else {
        Send(keyMap.right)
    }
}
*g:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyEnd)
    } else {
        Send(keyMap.end)
    }
}
*q:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyHome)
    } else {
        Send(keyMap.home)
    }
}
*e:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyPreviousWord)
    } else {
        Send(keyMap.previousWord)
    }
}
*d:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_SPACE)) {
        Send(keyMap.shift . keyMap.onlyNextWord)
    } else {
        Send(keyMap.nextWord)
    }
}
*u:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyBackspace)
    } else {
        Send(keyMap.backspace)
    }
}
*p:: {
    if (modeData_9.isOpenSubMode(SUB_MODE_I)) {
        Send(keyMap.ctrl . keyMap.onlyDelete)
    } else {
        Send(keyMap.delete)
    }
}
#HotIf