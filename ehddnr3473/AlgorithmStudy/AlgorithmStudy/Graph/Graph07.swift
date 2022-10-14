//
//  Graph07.swift
//  AlgorithmStudy
//
//  Created by 김동욱 on 2022/10/14.
//

// 백준 1753 다익스트라 - 리스트
import Foundation

let infinity = Int(1e9)
let inputData = readLine()!.components(separatedBy: " ").map { Int($0)! }
let (numberOfVertices, numberOfEdges) = (inputData[0], inputData[1])

let startVertex = Int(readLine()!)!

var graph = Array(repeating: Array(repeating: infinity, count: numberOfVertices + 1), count: numberOfVertices + 1)
var visited = Array(repeating: false, count: numberOfVertices + 1)

var minWeight = Array(repeating: infinity, count: numberOfVertices + 1)

for index in 1...numberOfVertices {
    graph[index][index] = 0
}

for _ in 0..<numberOfEdges {
    let inputData = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let (departure, destination, weight) = (inputData[0], inputData[1], inputData[2])
    
    graph[departure][destination] = weight
}

func searchMinWeight() -> Int {
    var minValue = infinity
    var minIndex = 0
    for index in 1...numberOfVertices {
        if minWeight[index] < minValue && !visited[index] {
            minValue = minWeight[index]
            minIndex = index
        }
    }
    return minIndex
}

func solution(_ start: Int) {
    visited[start] = true
    
    for destination in 1...numberOfVertices {
        minWeight[destination] = graph[start][destination]
    }
    
    for _ in 1...numberOfVertices-1 {
        let now = searchMinWeight()
        visited[now] = true
        
        for destination in 1...numberOfVertices {
            let viaWeight = minWeight[now] + graph[now][destination]
            if viaWeight < minWeight[destination] {
                minWeight[destination] = viaWeight
            }
        }
    }
}

solution(startVertex)

for index in 1...numberOfVertices {
    if minWeight[index] == infinity {
        print("INF")
    } else {
        print(minWeight[index])
    }
}
