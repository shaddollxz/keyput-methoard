SetTitleMatchMode(2)

getChangeTabType() {
    ; 使用 ctrl + tab 切换标签页的软件
    ctrlTabList := ["Mozilla Firefox", "Google Chrome"]
    ; 使用 ctrl + pageDown 切换标签页的软件
    ctrlDnList := ["Microsoft​ Edge", "Visual Studio Code", "Sublime Text", "Opera"]

    for (ctrlTab in ctrlTabList) {
        if (WinActive(ctrlTab)) {
            return "ctrl"
        }
    }

    for (ctrlDn in ctrlDnList) {
        if (WinActive(ctrlDn)) {
            return "dn"
        }
    }

    return
}