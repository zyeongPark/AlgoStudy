//
//  heapSort.swift
//  Algorithm
//
//  Created by 박지영 on 2022/10/18.
//
import Foundation
//힙소트 공부용
func heapify<T : Comparable>(_ array: inout [T], _ i: Int, _ size: Int) {
    var largest = i
    let left = i * 2 + 1
    let right = i * 2 + 2
    if left < size && array[largest] < array[left] {
        largest = left
    }
    if right < size && array[largest] < array[right] {
        largest = right
    }
    
    if largest != i {
        swap(&array, largest, i)
        heapify(&array, largest, size)
    }
}
func swap<T : Comparable>(_ array: inout [T] , _ i: Int, _ j: Int) {
    let temp = array[i]
    array[i] = array[j]
    array[j] = temp
}
func buildHeap<T : Comparable>(_ array: inout [T]) {
    var i = array.count/2
    
    while i >= 0 {
        heapify(&array, i, array.count)
        i -= 1
    }
}
func heapSort<T : Comparable>(_ array: inout [T]) -> [T] {
    buildHeap(&array)
    var size = array.count
    var i = size - 1
    while i >= 1 {
        swap(&array, i, 0)
        print("\(array)")
            
        i -= 1
        size -= 1
        
        heapify(&array, 0, size)
        
        print("\(array)")
    }
    
    return array
}

//백준 24173 의사코드
//heap_sort(A[1..n]) { # A[1..n]을 정렬한다.
//    build_min_heap(A, n);
//    for i <- n downto 2 {
//        A[1] <-> A[i];  # 원소 교환
//        heapify(A, 1, i - 1);
//    }
//}
//
//build_min_heap(A[], n) {
//    for i <- ⌊n / 2⌋ downto 1
//        heapify(A, i, n)
//}
//
//# A[k]를 루트로 하는 트리를 최소 힙 성질을 만족하도록 수정한다.
//# A[k]의 두 자식을 루트로 하는 서브 트리는 최소 힙 성질을 만족하고 있다.
//# n은 배열 A의 전체 크기이며 최대 인덱스를 나타낸다.
//heapify(A[], k, n) {
//    left <- 2k; right <- 2k + 1;
//    if (right ≤ n) then {
//        if (A[left] < A[right]) then smaller <- left;
//                                else smaller <- right;
//    }
//    else if (left ≤ n) then smaller <- left;
//    else return;
//
//    # 최소 힙 성질을 만족하지 못하는 경우 재귀적으로 수정한다.
//    if (A[smaller] < A[k]) then {
//        A[k] <-> A[smaller];
//        heapify(A, smaller, n);
//    }
//}
