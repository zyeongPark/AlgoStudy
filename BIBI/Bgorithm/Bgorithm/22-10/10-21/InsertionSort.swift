import Foundation

func InsertionSort(_ array: inout [Int]) {
    for stand in 1 ..< array.count {
        for idx in stride(from: stand, to: 0, by: -1) {
            if array[idx] < array[idx-1] { // 이전 값보다 크다면 swap
                array.swapAt(idx, idx-1)
            } else {
                break
            }
        }
    }
}
