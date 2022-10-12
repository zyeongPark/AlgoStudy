//
//  File.swift
//  AlgorithmStudy
//
//  Created by 김동욱 on 2022/10/12.
//

// 백준 11404 Floyd Warshall
import Foundation

let infinity = Int(1e9)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var route = Array(repeating: Array(repeating: infinity, count: n+1), count: n+1)

func solution() {
    for i in 1...n {
        route[i][i] = 0
    }
    for _ in 0..<m {
        let inputData = readLine()!.components(separatedBy: " ").map {Int($0)!}
        let (departure, destination, charge) = (inputData[0], inputData[1], inputData[2])
        
        route[departure][destination] = min(route[departure][destination], charge)
    }
    
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                route[i][j] = min(route[i][k] + route[k][j], route[i][j])
            }
        }
    }
}

solution()

for i in 1...n {
    for j in 1...n {
        if route[i][j] == infinity {
            print(0, terminator: " ")
        } else {
            print(route[i][j], terminator: " ")
        }
    }
    print()
}
