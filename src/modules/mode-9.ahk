#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

modeData_9 := useMode("9")

*9:: {
    modeData_9.openMode()
}

; 对应模式下的映射
#HotIf (modeData_9.isOpenMode)
*w:: {
    Send(keyMap.up)
}
*s:: {
    Send(keyMap.down)
}
*a:: {
    Send(keyMap.left)
}
*f:: {
    Send(keyMap.right)
}
*g:: {
    Send(keyMap.end)
}
*q:: {
    Send(keyMap.home)
}
*e:: {
    Send(keyMap.previousWord)
}
*d:: {
    Send(keyMap.nextWord)
}
*u:: {
    Send(keyMap.backspace)
}
*p:: {
    Send(keyMap.delete)
}
#HotIf