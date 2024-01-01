#Include "../configs/key-map.ahk"
#Include "../utils/use-mode.ahk"

mode_3 := useMode("3")


*3:: {
    mode_3.openMode()
}

; 对应模式下的映射
#HotIf (mode_3.isOpenMode)
*n:: {
    Send("1")
}
*m:: {
    Send("2")
}
*,::
*.:: {
    Send("3")
}
*h:: {
    Send("0")
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
#HotIf