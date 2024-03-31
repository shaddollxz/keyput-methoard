#Include "../configs/key-map.ahk"

; 右侧 ctrl 和 alt 换位
RCtrl::RAlt
RAlt::RCtrl

; 左ctrl + q 关闭当前活动窗口
<^q:: {
    try {
        WinClose("A")
    }
}

; 左ctrl + h 隐藏当前活动窗口
<^h:: {
    try {
        WinMinimize("A")
    }
}

; ctrl + space 打开搜索
<^Space:: {
    Send(keyMap.win . "s")
}

; ctrl + 左键 右键
<#LButton:: {
    Click("Right")
}
