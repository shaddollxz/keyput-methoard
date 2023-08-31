#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

modeData_3 := useMode("3")


*3:: {
    modeData_3.openMode()
}

; 对应模式下的映射
#HotIf (modeData_3.isOpenMode)
*Space:: {
    Send("0")
}
*b:: {
    Send("1")
}
*n:: {
    Send("2")
}
*m:: {
    Send("2")
}
*.:: {
    Send("3")
}
*h:: {
    Send("4")
}
*j:: {
    Send("4")
}
*k:: {
    Send("5")
}
*l:: {
    Send("6")
}
*y:: {
    Send("7")
}
*u:: {
    Send("7")
}
*i:: {
    Send("8")
}
*o:: {
    Send("8")
}
*p:: {
    Send("9")
}

*r:: {
    Send(keyMap.delete)
}
*q:: {
    Send(keyMap.backspace)
}
*1:: {
    Send(keyMap.backspace)
}
#HotIf