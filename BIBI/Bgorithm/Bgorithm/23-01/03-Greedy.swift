//
//  01-03.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/03.
//

/// 그리디 알고리즘 - 큰 수의 법칙
/// 풀이 : https://byukbyak.tistory.com/425

import Foundation

func Greedy_1() {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    var (N, M, K) = (input[0], input[1], input[2])
    var array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    array.sort()
    let first = array[N - 1] // 가장 큰 수
    let second  = array[N - 2] // 두번째로 큰 수
    
    var result = 0
    var count = 1
    
    for _ in 0 ..< M {
        if count <= K {
            result += first
            count += 1
        } else {
            result += second
            count = 1
        }
    }
    
    print(result)
}
