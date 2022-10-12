
/* [DAY35] Graph - Floyd Warshall */
// [백준] 11404. 플로이드

let INF: Int = Int(1e9)
let n = Int(readLine()!) ?? 0
let m = Int(readLine()!) ?? 0

var graph = Array(repeating: Array(repeating: INF, count: n+1), count: n+1)

for i in 0 ..< m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, cost) = (input[0], input[1], input[2])
    if (i >= 0) && (i <= n) {
        if graph[i][i] != 0 { graph[i][i] = 0 }
    }
    graph[a][b] = min(cost, graph[a][b])
}

for k in 1...n {
    for i in 1...n {
        for j in 1...n {
            graph[i][j] = min(graph[i][j], graph[i][k] + graph[k][j])
        }
    }
}

for i in 1...n {
    for j in  1...n {
        if graph[i][j] == INF {
            print(0, terminator: " ")
        } else {
            print(graph[i][j], terminator: " ")
        }
    }
    print()
}
