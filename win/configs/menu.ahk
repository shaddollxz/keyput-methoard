A_TrayMenu.Add()
A_TrayMenu.Add("Keep Caps Lower", MenuHandler)

EnvSet("Lock_Caps_Lower", true)
A_TrayMenu.Check("Keep Caps Lower")

MenuHandler(itemName, itemPos, MyMenu) {
    lockCapsLower := EnvGet("Lock_Caps_Lower")

    EnvSet("Lock_Caps_Lower", !lockCapsLower)

    if (!lockCapsLower) {
        A_TrayMenu.Check("Keep Caps Lower")
    } else {
        A_TrayMenu.Uncheck("Keep Caps Lower")
    }
}
