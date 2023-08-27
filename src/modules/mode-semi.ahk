#Include "../utils/use-mode.ahk"

modeData_semi := useMode(";")


*;:: {
    modeData_semi.openMode()
}

; 9模式下的映射
#HotIf (modeData_semi.isOpenMode)
*q:: {
    Send("{bluding}{Esc}")
}
*w:: {
    Send("{{}")
}
*e:: {
    Send("(")
}
*r:: {
    Send("<")
}
*t:: {
    Send(">")
}
*y:: {
    Send("%")
}
*u:: {
    Send("*")
}
*i:: {
    Send("/")
}
*o:: {
    Send('"')
}
*p:: {
    return
}
*a:: {
    Send("@")
}
*s:: {
    Send("&")
}
*d:: {
    Send("|")
}
*f:: {
    Send("{!}")
}
*g:: {
    Send("=>")
}
*h:: {
    Send("=")
}
*j:: {
    Send("{+}")
}
*k:: {
    Send("-")
}
*l:: {
    Send("``")
}
*z:: {
    Send("{#}")
}
*x:: {
    Send("_")
}
*c:: {
    Send("{^}")
}
*v:: {
    Send(":")
}
*b:: {
    Send("$")
}
*n:: {
    Send("?")
}
*m:: {
    Send("~")
}
#HotIf