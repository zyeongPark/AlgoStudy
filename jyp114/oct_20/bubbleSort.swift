//
//  bubbleSort.swift
//  Algorithm
//
//  Created by 박지영 on 2022/10/20.
//

import Foundation
//bubble sort
let input = [7,4,1,3,5]
//stable 설명용
//let input = [7,3,6,2,3]
//7 "3" 6 2 3
//"3" 6 2 3 7
//"3" 2 3 6 7
//2 "3" 3 6 7 ==> 안정!(stable)

func bubbleSort(array: [Int]) -> [Int]{
    var arr = array
    for i in 0..<arr.count{
        for j in 0..<arr.count-1-i{ //수정 arr.count-1이 아니라 arr.count-i-1 해주면 끝에서 정렬된 거 또 안봐도 되니까!
            if arr[j] > arr[j+1]{
                arr.swapAt(j, j+1)
            }
        }
    }
    return arr
}

print(bubbleSort(array: input))


