func selectSort(compare: (Int, Int) -> Bool) {
    var array = [3, 5, 2, 1, 4, 6, 9, 8, 10]
    for i in 0..<array.count {
        var minIndex = i
        for j in i + 1..<array.count {
            if compare(array[j], array[minIndex]) {
                minIndex = j
            }
        }
        array.swapAt(i, minIndex)
    }
    print(array)
}

