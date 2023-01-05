//
//  05.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/04.
//

/// 구현 알고리즘 - 왕실의 나이트
/// 풀이 : https://zrr.kr/pOVd

import Foundation

let input = readLine() ?? ""
let row = Int(String(input.last!))!
let col = Int(input.first!.asciiValue!) - 96 // 97은 'a'의 아스키 코드, a일 경우 1로 표시 되어야 하기 때문에 96을 빼준다.

let moves = [(-2, -1), (-1,-2), (2,-1), (1,-2), (2,1), (1,2), (-1,2), (-2,1)]
var result = 0

for move in moves {
    var nextX = row + move.0
    var nextY = col + move.1
    
    if isInRange(nextX,nextY) {
        result += 1
    }
}

print(result)

func isInRange(_ x: Int, _ y: Int) -> Bool {
    return (1...8 ~= x) && (1...8 ~= y) // ~= 볌위 연산자 : Bool 값
}
