useTimer() {
    startTime := A_TickCount

    duration(_arg*) {
        return A_TickCount - startTime
    }

    returnData := {
        startTime: startTime,
        duration: duration
    }

    return returnData
}