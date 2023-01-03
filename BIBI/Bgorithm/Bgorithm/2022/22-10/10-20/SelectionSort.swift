import Foundation

func SelectionSort(_ array: inout [Int]) {
    for standard in 0 ..< (array.count - 1) {
        var minIdx = standard
        for idx in (standard + 1) ..< array.count { // 기준 바로 다음부터 탐색
            if array[idx] < array[minIdx] {
                minIdx = index
            }
        }
        array.swapAt(standard, minIdx)
    }
}
