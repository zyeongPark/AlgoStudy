struct SortData: Comparable {
    static func < (lhs: SortData, rhs: SortData) -> Bool {
        lhs.value < rhs.value
    }
    
    let index: Int
    let value: Int
}

final class SortManager<T: Comparable> {
    let compare: (T, T) -> Bool
    
    init(compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    func bubbleSort() {
        var array: [SortData] = [SortData(index: 0, value: 1), SortData(index: 1, value: 9), SortData(index: 2, value: 5),
                                 SortData(index: 3, value: 4),SortData(index: 4, value: 7),SortData(index: 5, value: 8),
                                 SortData(index: 6, value: 2),SortData(index: 7, value: 9),SortData(index: 8, value: 9)]
        
        for i in 0..<array.count {
            for j in 0..<array.count - i - 1 {
                if compare(array[j] as! T, array[j + 1] as! T) {
                    array.swapAt(j, j + 1)
                } else { break }
            }
        }
        array.forEach { print($0) }
    }
}

let sortManager = SortManager<SortData>(compare: >)
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

