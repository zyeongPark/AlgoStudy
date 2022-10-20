//
//  heap.swift
//  Algorithm
//
//  Created by 박지영 on 2022/10/17.
//

import Foundation
class BinaryHeap {
    
    var items = [Int]()
    
    init(_ val: Int) {
        items.append(val)
        items.append(val)
    }
    
    func up_number() {
        var i = items.count-1
        var parent = Int(i / 2)
        while parent > 0 {
            if items[i] < items[parent] {
                items.swapAt(i, parent)
            }
            i = parent
            parent = Int(i / 2)
        }
    }
    
    func insert(k: Int) {
        items.append(k)
        up_number()
    }
    
    func down_number(idx: Int) {
        let left = idx * 2
        let right = idx * 2 + 1
        var smallest = idx
        
        if left <= items.count-1 && items[left] < items[smallest] {
            smallest = left
        }
        
        if right <= items.count-1 && items[right] < items[smallest] {
            smallest = right
        }
        
        if smallest != idx {
            items.swapAt(idx, smallest)
            percolate_down(idx: smallest)
        }
    }
    
    func extract() -> Int {
        let extracted = items[1]
        items[1] = items[items.count-1]
        items.popLast()
        down_number(idx: 1)
        return extracted
    }
}
