find(arr, findCallBack) {
    for (item in arr) {
        if (findCallBack(item)) {
            return item
        }
    }
}

/**
 * 模拟 JavaScript 的 Array.sort() 方法
 * @param {Array} arr - 要排序的数组
 * @param {Function} [compareFn] - 比较函数 (可选)
 * @returns {Array} - 排序后的数组 (原地修改)
 */
sort(arr, compareFn := unset) {
    ; 如果没有提供比较函数，使用默认的字符串比较
    if !IsSet(compareFn) {
        compareFn := (a, b) => a > b ? 1 : a < b ? -1 : 0
    }

    ; 实现快速排序算法
    quickSort(arr, 1, arr.Length, compareFn)
    return arr
}

/**
 * 快速排序实现
 * @param {Array} arr - 数组
 * @param {Integer} left - 左边界
 * @param {Integer} right - 右边界
 * @param {Function} compareFn - 比较函数
 */
quickSort(arr, left, right, compareFn) {
    if (left >= right) {
        return
    }

    ; 选择基准值并分区
    pivotIndex := partition(arr, left, right, compareFn)

    ; 递归排序左右分区
    quickSort(arr, left, pivotIndex - 1, compareFn)
    quickSort(arr, pivotIndex + 1, right, compareFn)
}

/**
 * 分区函数
 */
partition(arr, left, right, compareFn) {
    ; 选择中间元素作为基准值
    pivotIndex := left + Floor((right - left) / 2)
    pivotValue := arr[pivotIndex]

    ; 将基准值交换到最右边
    swap(arr, pivotIndex, right)

    storeIndex := left

    ; 遍历并重新排列元素
    loop right - left {
        i := left + A_Index - 1
        if (compareFn(arr[i], pivotValue) < 0) {
            swap(arr, i, storeIndex)
            storeIndex++
        }
    }

    ; 将基准值放回正确位置
    swap(arr, storeIndex, right)
    return storeIndex
}

/**
 * 交换数组中的两个元素
 */
swap(arr, i, j) {
    temp := arr[i]
    arr[i] := arr[j]
    arr[j] := temp
}
