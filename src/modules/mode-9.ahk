#Include "../configs/key-maps/cursorMoveKeyMap.ahk"
#Include "../configs/key-maps/specialKeyMap.ahk"
#Include "../utils/use-mode.ahk"

modeData_9 := useMode("9")

*9:: {
    modeData_9.openMode()
}

; 对应模式下的映射
#HotIf (modeData_9.isOpenMode)
*w:: {
    Send(cursorMoveKeyMap.up)
}
*s:: {
    Send(cursorMoveKeyMap.down)
}
*a:: {
    Send(cursorMoveKeyMap.left)
}
*f:: {
    Send(cursorMoveKeyMap.right)
}
*g:: {
    Send(cursorMoveKeyMap.end)
}
*q:: {
    Send(cursorMoveKeyMap.home)
}
*e:: {
    Send(cursorMoveKeyMap.previousWord)
}
*d:: {
    Send(cursorMoveKeyMap.nextWord)
}
*u:: {
    Send(specialKeyMap.backspace)
}
*p:: {
    Send(specialKeyMap.delete)
}
#HotIf