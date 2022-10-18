func bubbleSort(compare: (Int, Int) -> Bool) {
    var array = [3, 5, 2, 1, 4, 6, 9, 8, 10]
    for i in 0..<array.count {
        for j in 0..<array.count - i - 1 {
            if compare(array[j], array[j + 1]) {
                array.swapAt(j, j + 1)
            }
        }
    }
    print(array)
}

