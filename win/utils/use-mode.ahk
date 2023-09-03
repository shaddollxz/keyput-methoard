#Include "../configs/config.ahk"
#Include "./array.ahk"

useMode(pressKey, upOutput?) {
    subModes := []
    returnData := {
        isOpenMode: false,
        openMode: openMode,
        addSubMode: addSubMode,
        switchSubMode: switchSubMode,
        isOpenSubMode: isOpenSubMode
    }

    openMode(_) {
        returnData.isOpenMode := true

        ; 开启模式的键松开时的后续操作
        KeyWait(pressKey)

        returnData.isOpenMode := false
        for (item in subModes) {
            item.isOpenMode := false
        }

        ; openMode() 调用处的键位设置为 *keyPress
        ; 如果松开时还是这个热键，就输出它
        if (A_ThisHotkey = "*" . pressKey) {
            outuptKey := IsSet(upOutput) ? upOutput : pressKey
            return Send("{Blind}" . outuptKey)
        }
    }

    addSubMode(_, key) {
        subModes.Push({ key: key, isOpenMode: false })
    }

    isOpenSubMode(_, key) {
        subModeData := find(subModes, (item) => item.key == key)
        return subModeData.isOpenMode
    }

    switchSubMode(_, key) {
        subModeData := find(subModes, (item) => item.key == key)
        subModeData.isOpenMode := !subModeData.isOpenMode
    }

    return returnData
}