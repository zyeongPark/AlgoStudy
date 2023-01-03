import Foundation

func BubbleSort(_ array: inout [Int]) {
    for i in stride(from: array.count - 1, to: 1, by: -1) {
        var check = true
        for j in 0 ..< i {
            if array[j] > array[j+1] {
                array.swapAt(j, j+1)
                check = false
            }
        }
        if check { break } // swap이 1번도 일어나지 않았다면 이미 정렬되어있으므로 종료
    }
}
