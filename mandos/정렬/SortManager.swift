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
