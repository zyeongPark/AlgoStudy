//
//  bubbleSort.swift
//  Algorithm
//
//  Created by 박지영 on 2022/10/20.
//

import Foundation
let input = readLine()!.map{ $0 }
//파이썬은 ord 내장함수 활용
let x = Int(input[0].asciiValue! - Character("a").asciiValue!) //파이썬은 ord 내장함수 활용
let y = Int(String(input[1]))! + 1
let dx = [-2, -1, 1, 2, 2, 1, -1, -2]
let dy = [1, -2, -2, -1, 1, 2, 2, 1]
var answer = 0

for i in 0..<8 {
    let nx = x + dx[i]
    let ny = x + dy[i]
    
    if nx >= 1 && nx <= 8 && ny >= 1 && ny <= 8{
        answer += 1
    }
}

print(answer)



//구현 문제는 모듈화 & 확인해보는 과정 중요
//백준 -> 삼성 기출 문제들이 대부분 구현 (쓰여봤자 dfs,bfs) 이니까 공부하면 굿
//map 함수는 시간복잡도 log(N)
// input = readline() ?? "" 사용하는 거 눈에 익히기
//삼항연산자 -> 굳이 사용하지 않아도 되는 경우에는 굳이 쓰지 말자(가독성 하락)




