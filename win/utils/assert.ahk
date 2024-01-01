isBrowser() {
    browserList := ["Mozilla Firefox", "Google Chrome", "Microsoft​ Edge", "Opera"]

    for (browser in browserList) {
        OutputDebug(WinActive(browser))
        if (WinActive(browser)) {
            return true
        }
    }
}

isVscode() {
    return WinActive("Visual Studio Code")
}