#Include "../utils/use-mode.ahk"

mode_quote := useMode("'")


*':: {
    mode_quote.openMode()
}

; 对应模式下的映射
#HotIf (mode_quote.isOpenMode)
*w:: {
    Send("{}}")
}
*e:: {
    Send(")")
}
*r:: {
    Send(">")
}
*t:: {
    Send(">")
}
*Space:: {
    Send("\")
}
*g:: {
    Send("->")
}
#HotIf
