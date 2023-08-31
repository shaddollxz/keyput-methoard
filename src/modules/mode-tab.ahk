#Include "../utils/use-mode.ahk"
#Include "../configs/key-map.ahk"

; 这里将 tab 映射为 ctrl + alt
; 一般很少快捷键会映射到这个位置（因为难按），用来做自定义的快捷键位置

modeData_tab := useMode("Tab", keyMap.onlyTab)


*Tab:: {
    modeData_tab.openMode()
}

#HotIf (modeData_tab.isOpenMode)

#HotIf