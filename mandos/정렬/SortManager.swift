struct SortData: Comparable {
    static func < (lhs: SortData, rhs: SortData) -> Bool {
        lhs.value < rhs.value
    }
    
    let index: Int
    let value: Int
}

final class SortManager<T: Comparable> {
    let compare: (T, T) -> Bool
    var array: [T] = []
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    func bubbleSort() {
        array.shuffle()
        for i in 0..<array.count {
            for j in 0..<array.count - i - 1 {
                if compare(array[j], array[j + 1]) {
                    array.swapAt(j, j + 1)
                }
            }
        }
        print("==버블 정렬 결과==")
        array.forEach { print($0) }
        print()
    }
    
    func selectSort() {
        array.shuffle()
        for i in 0..<array.count {
            var minIndex = i
            for j in i + 1..<array.count {
                if compare(array[minIndex], array[j]) {
                    minIndex = j
                }
            }
            array.swapAt(i, minIndex)
        }
        print("==선택 정렬 결과==")
        array.forEach { print($0) }
        print()
    }
    
    func insertSort() {
        array.shuffle()
        for i in 1..<array.count {
            for j in (1...i).reversed() {
                if compare(array[j - 1], array[j]) {
                    array.swapAt(j, j - 1)
                } else { break }
            }
        }
        print("==삽입 정렬 결과==")
        array.forEach { print($0) }
        print()
    }
    
    func stableQuickSort(array: [SortData]) -> [SortData] {
        guard array.count > 1 else { return array }
        let pivot = array.first!
        let left = array.filter { $0.value <  pivot.value }
        let equal = array.filter { $0.value == pivot.value }
        let right = array.filter { $0.value > pivot.value }
        return stableQuickSort(array: left) + equal + stableQuickSort(array: right)
    }
    
    func quickSort(array: inout [SortData], p: Int, r: Int) {
        if p < r {
            let q = partition(array: &array, p: p, r: r)
            quickSort(array: &array, p: p, r: q - 1)
            quickSort(array: &array, p: q + 1, r: r)
        }
    }

    func partition(array: inout [SortData], p: Int, r: Int) -> Int {
        let x = array[r].value
        var i = p - 1
        for j in p...r - 1 {
            if array[j].value <= x {
                i += 1
                array.swapAt(i, j)
            }
        }
        if i + 1 != r {
            array.swapAt(i + 1, r)
        }
        return i + 1
    }
}

let sortManager = SortManager<SortData>(compare: >)
sortManager.array = [SortData(index: 0, value: 1), SortData(index: 1, value: 9), SortData(index: 2, value: 5),
                     SortData(index: 3, value: 4),SortData(index: 4, value: 7),SortData(index: 5, value: 8),
                     SortData(index: 6, value: 2),SortData(index: 7, value: 9),SortData(index: 8, value: 9)]
sortManager.bubbleSort()

// Stable하다!

// SortData(index: 0, value: 1)
// SortData(index: 6, value: 2)
// SortData(index: 3, value: 4)
// SortData(index: 2, value: 5)
// SortData(index: 4, value: 7)
// SortData(index: 5, value: 8)
// SortData(index: 1, value: 9)
// SortData(index: 7, value: 9)
// SortData(index: 8, value: 9)

sortManager.selectSort()

//SortData(index: 0, value: 1)
//SortData(index: 6, value: 2)
//SortData(index: 3, value: 4)
//SortData(index: 2, value: 5)
//SortData(index: 4, value: 7)
//SortData(index: 5, value: 8)
//SortData(index: 1, value: 9)
//SortData(index: 7, value: 9)
//SortData(index: 8, value: 9)

sortManager.insertSort()

//SortData(index: 0, value: 1)
//SortData(index: 6, value: 2)
//SortData(index: 3, value: 4)
//SortData(index: 2, value: 5)
//SortData(index: 4, value: 7)
//SortData(index: 5, value: 8)
//SortData(index: 1, value: 9)
//SortData(index: 7, value: 9)
//SortData(index: 8, value: 9)

var array = [SortData(index: 0, value: 1), SortData(index: 1, value: 9), SortData(index: 2, value: 5),
             SortData(index: 3, value: 4),SortData(index: 4, value: 7),SortData(index: 5, value: 8),
             SortData(index: 6, value: 2),SortData(index: 7, value: 9),SortData(index: 8, value: 9),
             SortData(index: 9, value: 1)]
print("==안정 퀵 정렬 결과==")
sortManager
    .stableQuickSort(array: array)
    .forEach { print($0) }
print()

print("==불안정 퀵 정렬 결과==")
sortManager
    .quickSort(array: &array, p: 0, r: array.count - 1)
array.forEach { print($0) }
