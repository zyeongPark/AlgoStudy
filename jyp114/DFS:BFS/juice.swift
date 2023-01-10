//
//  juice.swift
//  Algorithm
//
//  Created by 박지영 on 2023/01/09.
//

import Foundation
let input = readLine()!.split(separator: " ").map { Int($0)! } //띄어쓰기로 정수 값 2개 받기
let n = input[0]
let m = input[1]
//print(input)
//print(n,m)

var graph: [[Int]] = []
for i in 0..<n{
    graph.append(readLine()!.map { Int(String($0))! })
}
    
func dfs(x: Int, y: Int) -> Bool{
    //범위 내에 없으면 false
    if (x <= -1 || x >= n || y <= -1 || y >= m) {
        return false
    }
    //범위 내에 있다면,
    if graph[x][y] == 0{
        //해당 위치 방문처리하고
        graph[x][y] = 1
        //상하좌우 순서대로 dfs 돌려서 방문처리하기(재귀활용)
        dfs(x: x, y: y+1)
        dfs(x: x, y: y-1)
        dfs(x: x-1, y: y)
        dfs(x: x+1, y: y)
        return true
    }
    return false
}
    
var answer = 0
for i in 0..<n{
    for j in 0..<m{
        if dfs(x: i, y: j) == true{
            answer += 1
            
        }
    }
}
print(answer)

