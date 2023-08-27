#Include "../configs/config.ahk"

useMode(pressKey, upOutput?) {
    returnData := {
        isOpenMode: false,
        openMode: openMode
    }

    openMode(_arg*) {
        returnData.isOpenMode := true

        ; 开启模式的键松开时的后续操作
        KeyWait pressKey

        returnData.isOpenMode := false
        ; 这里判断是否在指定时间内只按下了这个键
        ; openMode() 调用处的键位设置为 *keyPress
        if (A_ThisHotkey = "*" . pressKey && A_TimeSinceThisHotkey < IGNORE_TIME) {
            outuptKey := IsSet(upOutput) ? upOutput : pressKey
            return Send("{Blind}" . outuptKey)
        }
    }


    return returnData
}