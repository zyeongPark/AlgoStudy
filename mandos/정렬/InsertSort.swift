func insertSort(compare: (Int, Int) -> Bool) {
    var array = [3, 5, 2, 1, 4, 6, 9, 8, 10]
    for i in 1..<array.count {
        for j in (1...i).reversed() {
            if compare(array[j], array[j - 1]) {
                array.swapAt(j, j - 1)
            } else { break }
        }
    }
    print(array)
}}
