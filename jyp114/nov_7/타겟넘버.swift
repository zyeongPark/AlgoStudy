//
//  bubbleSort.swift
//  Algorithm
//
//  Created by 박지영 on 2022/10/20.
//

import Foundation
//프로그래머스_타겟넘버
func solution(_ numbers:[Int], _ target:Int) -> Int {
    
    numbersCopy = numbers
    targetCopy = target
    dfs(0, 0)
    
    return count
}
var numbersCopy = [Int]()
var targetCopy = 0
var count = 0

func dfs(_ depth: Int, _ sum: Int) {
 
    if depth == numbersCopy.count {
        if sum == targetCopy {
            count += 1
        }
        return
    }
    
    dfs(depth + 1, sum + numbersCopy[depth])
    dfs(depth + 1, sum - numbersCopy[depth])
    
}
 




