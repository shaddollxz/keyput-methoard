isBrowser() {
    browserList := ["Mozilla Firefox", "Google Chrome", "Microsoft​ Edge", "Opera"]

    for (browser in browserList) {
        if (WinActive(browser)) {
            return true
        }
    }
}