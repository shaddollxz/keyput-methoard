#Include "../utils/use-mode.ahk"

modeData_quote := useMode("'")


*':: {
    modeData_quote.openMode()
}

; 对应模式下的映射
#HotIf (modeData_quote.isOpenMode)
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
#HotIf