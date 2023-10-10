; 右侧 ctrl 和 alt 换位
RCtrl::RAlt
RAlt::RCtrl

; 左ctrl + q 关闭当前活动窗口
<^q:: {
    WinClose("A")
}

; 左ctrl + h 隐藏当前活动窗口
<^h:: {
    WinMinimize("A")
}