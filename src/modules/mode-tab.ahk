#Include "../utils/use-mode.ahk"
#Include "../configs/key-map.ahk"

; 这里将 tab 映射为 ctrl + alt
; 很少有默认快捷键会映射到这个位置（因为难按）
; 用来做软件中自定义的快捷键的快速触发位置

modeData_tab := useMode("Tab", keyMap.onlyTab)


*Tab:: {
    modeData_tab.openMode()
}

#HotIf (modeData_tab.isOpenMode)
*1:: {
    Send(keyMap.ctrl . keyMap.alt . "1")
}
*2:: {
    Send(keyMap.ctrl . keyMap.alt . "2")
}
*3:: {
    Send(keyMap.ctrl . keyMap.alt . "3")
}
*4:: {
    Send(keyMap.ctrl . keyMap.alt . "4")
}
*5:: {
    Send(keyMap.ctrl . keyMap.alt . "5")
}
*6:: {
    Send(keyMap.ctrl . keyMap.alt . "6")
}
*7:: {
    Send(keyMap.ctrl . keyMap.alt . "7")
}
*8:: {
    Send(keyMap.ctrl . keyMap.alt . "8")
}
*9:: {
    Send(keyMap.ctrl . keyMap.alt . "9")
}
*0:: {
    Send(keyMap.ctrl . keyMap.alt . "0")
}
*-:: {
    Send(keyMap.ctrl . keyMap.alt . "-")
}
*=:: {
    Send(keyMap.ctrl . keyMap.alt . "=")
}
*q:: {
    Send(keyMap.ctrl . keyMap.alt . "q")
}
*w:: {
    Send(keyMap.ctrl . keyMap.alt . "w")
}
*e:: {
    Send(keyMap.ctrl . keyMap.alt . "e")
}
*r:: {
    Send(keyMap.ctrl . keyMap.alt . "r")
}
*t:: {
    Send(keyMap.ctrl . keyMap.alt . "t")
}
*y:: {
    Send(keyMap.ctrl . keyMap.alt . "y")
}
*u:: {
    Send(keyMap.ctrl . keyMap.alt . "u")
}
*i:: {
    Send(keyMap.ctrl . keyMap.alt . "i")
}
*o:: {
    Send(keyMap.ctrl . keyMap.alt . "o")
}
*p:: {
    Send(keyMap.ctrl . keyMap.alt . "p")
}
*[:: {
    Send(keyMap.ctrl . keyMap.alt . "[")
}
*]:: {
    Send(keyMap.ctrl . keyMap.alt . "]")
}
*\:: {
    Send(keyMap.ctrl . keyMap.alt . "\")
}
*a:: {
    Send(keyMap.ctrl . keyMap.alt . "a")
}
*s:: {
    Send(keyMap.ctrl . keyMap.alt . "s")
}
*d:: {
    Send(keyMap.ctrl . keyMap.alt . "d")
}
*f:: {
    Send(keyMap.ctrl . keyMap.alt . "f")
}
*g:: {
    Send(keyMap.ctrl . keyMap.alt . "g")
}
*h:: {
    Send(keyMap.ctrl . keyMap.alt . "h")
}
*j:: {
    Send(keyMap.ctrl . keyMap.alt . "j")
}
*k:: {
    Send(keyMap.ctrl . keyMap.alt . "k")
}
*l:: {
    Send(keyMap.ctrl . keyMap.alt . "l")
}
*;:: {
    Send(keyMap.ctrl . keyMap.alt . ";")
}
*':: {
    Send(keyMap.ctrl . keyMap.alt . "'")
}
*z:: {
    Send(keyMap.ctrl . keyMap.alt . "z")
}
*x:: {
    Send(keyMap.ctrl . keyMap.alt . "x")
}
*c:: {
    Send(keyMap.ctrl . keyMap.alt . "c")
}
*v:: {
    Send(keyMap.ctrl . keyMap.alt . "v")
}
*b:: {
    Send(keyMap.ctrl . keyMap.alt . "b")
}
*n:: {
    Send(keyMap.ctrl . keyMap.alt . "n")
}
*m:: {
    Send(keyMap.ctrl . keyMap.alt . "m")
}
*,:: {
    Send(keyMap.ctrl . keyMap.alt . ",")
}
*.:: {
    Send(keyMap.ctrl . keyMap.alt . ".")
}
*/:: {
    Send(keyMap.ctrl . keyMap.alt . "/")
}
#HotIf