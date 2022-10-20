// [DAY39] Heap Sort (minheap & maxheap)
// [백준] 24173. 알고리즘 수업 - 힙 정렬 1 -> 계속 틀리는 중 // 1 3 나옴

import Foundation

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (N, K) = (input[0], input[1])
var arr = [0]
arr.append(contentsOf: readLine()!.split(separator: " ").map{ Int(String($0))! })
var numOfSwap = 0
var answer = ""

heapSort()

if (numOfSwap < K) {
    print("-1")
} else {
    print(answer)
}

func heapSort() {
    print("=== heap sort ===")
    var size = arr.count
    
    while (size > 2) {
        numOfSwap += 1
        if (numOfSwap == K) {
            answer = "\(min(arr[1],arr[size-1])) \(max(arr[1],arr[size-1]))"
        }
        swap(1, size - 1)
        size -= 1
        minHeapifyRecursion(size, 1)
    }
}

func heapify(_ root: Int, _ n: Int) {
    let startIdx = (arr.count - 1) / 2
    for i in stride(from: startIdx, to: 1, by: -1) {
        minHeapifyRecursion(arr.count, i)
    }
}

func swap(_ i: Int, _ j: Int) {
    let tmp = arr[i]
    arr[i] = arr[j]
    arr[j] = tmp
}

// 자식 중 더 작은 자식이 부모보다 작다면 교환
func minHeapifyRecursion(_ size: Int, _ parent: Int) {
    let maxIdx = size - 1
    
    // 1. 자식 노드가 없다면
    if (parent * 2) > maxIdx { return }
    
    // 2. 자식 노드가 1개라면
    var smaller = parent * 2
    
    // 3. 자식 노드가 2개라면
    let right = parent * 2 + 1
    if (right <= maxIdx) && (arr[right] < arr[smaller]) {
        smaller = right
    }
    
    if (arr[smaller] < arr[parent]) {
        numOfSwap += 1
        if (numOfSwap == K) {
            answer = "\(min(arr[smaller],arr[parent])) \(max(arr[smaller],arr[parent]))"
            return
        }
        swap(parent, smaller)
        minHeapifyRecursion(size, smaller)
    }
}
