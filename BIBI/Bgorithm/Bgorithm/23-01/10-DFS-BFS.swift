//
//  10-DFS-BFS.swift
//  Bgorithm
//
//  Created by Doyeon on 2023/01/10.
//

/// 알고리즘 - DFS/BFS
/// 풀이 : https://zrr.kr/S5SE

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph = [[Int]]()
for _ in 0 ..< n {
    graph.append(readLine()!.map { Int(String($0))! })
}

//print(graph)
//[[0, 0, 1, 1, 0],
// [0, 0, 0, 1, 1],
// [1, 1, 1, 1, 1],
// [0, 0, 0, 0, 0]]

//4 5
//00110
//00011
//11111
//00000

func dfs(_ x: Int, _ y: Int) -> Bool {
    // 범위 벗어나면 종료
    if !isInRange(x, y) {
        return false
    }
    
    if graph[x][y] == 0 { // 방문하지 않은 노드
        graph[x][y] = 1 // 방문처리
        
        // 상하좌우 탐색
        dfs(x - 1, y)
        dfs(x, y - 1)
        dfs(x + 1, y)
        dfs(x, y + 1)
        
        return true // 주변이 다 막혀있다면 true 반환하고 종료
    }
    return false
}

func isInRange(_ x: Int, _ y: Int) -> Bool {
    return (0..<n ~= x) && (0..<m ~= y)
}

var result = 0

for i in 0 ..< n {
    for j in 0 ..< m {
        if dfs(i, j) {
            result += 1
        }
    }
}

print(result)
