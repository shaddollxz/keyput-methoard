find(arr, findCallBack) {
    for (item in arr) {
        if (findCallBack(item)) {
            return item
        }
    }
}