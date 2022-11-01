import Foundation

//func solution(_ n:Int, _ times:[Int]) -> Int64 {
//    var start = 1
//    var end = times.max()! * n
//
//    while start <= end {
//        let mid = start + (end - start) / 2
//        if isVaild(n: n, times: times, mid: mid) {
//            end = mid - 1
//        } else {
//            start = mid + 1
//        }
//    }
//
//    return Int64(start)
//}
//
//func isVaild(n: Int, times: [Int], mid: Int) -> Bool {
//    return times.map { mid / $0 }.reduce(0, +) >= n
//}

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
    
    func mergeSort(array: [T]) -> [T] {
        if array.count <= 1 { return array }
        let mid = array.count / 2
        let left = Array(array[0..<mid])
        let right = Array(array[mid..<array.count])

        func merge(left: [T], right: [T]) -> [T] {
            var left = left
            var right = right
            var sortedArray: [T] = []

            while !left.isEmpty && !right.isEmpty {
                if compare(right.first!, left.first!) {
                    sortedArray.append(left.removeFirst())
                } else {
                    sortedArray.append(right.removeFirst())
                }
            }

            if !left.isEmpty {
                sortedArray.append(contentsOf: left)
            }

            if !right.isEmpty {
                sortedArray.append(contentsOf: right)
            }

            return sortedArray
        }

        return merge(left: mergeSort(array: left), right: mergeSort(array: right))
    }
    
    func radixSort(array: inout [T]) {
        let radix = 10
        var flag = false
        var digit = 1
        
        while !flag {
            flag = true
            
            var buckets = [[T]](repeating: [T](repeating: SortData(index: 0, value: 0) as! T, count: 0), count: radix)
            
            array.forEach {
                let index = ($0 as! SortData).value / digit
                buckets[index % radix].append($0)
                if flag && index > 0 {
                    flag = false
                }
            }
            
            var i = 0
            
            [Int](0..<9).forEach {
                buckets[$0].forEach { bucket in
                    array[i] = bucket
                    i += 1
                }
            }
            
            digit *= radix
        }
    }

}

let sortManager = SortManager<SortData>(compare: >=)
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
print()

array = [SortData(index: 0, value: 1), SortData(index: 1, value: 9), SortData(index: 2, value: 5),
         SortData(index: 3, value: 4),SortData(index: 4, value: 7),SortData(index: 5, value: 8),
         SortData(index: 6, value: 2),SortData(index: 7, value: 9),SortData(index: 8, value: 9),
         SortData(index: 9, value: 1)]

print("==병합 정렬 결과==")
sortManager
    .mergeSort(array: array).forEach { print($0) }
print()

array = [SortData(index: 0, value: 1), SortData(index: 1, value: 9), SortData(index: 2, value: 5),
         SortData(index: 3, value: 4),SortData(index: 4, value: 7),SortData(index: 5, value: 8),
         SortData(index: 6, value: 2),SortData(index: 7, value: 9),SortData(index: 8, value: 9)]
print("==기수 정렬 결과==")
sortManager
    .radixSort(array: &array)
array.forEach { print($0) }
print()
