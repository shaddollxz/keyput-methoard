#Include "../configs/key-map.ahk"

; 关闭标签页
!q:: {
    Send(keyMap.ctrl . "w")
}