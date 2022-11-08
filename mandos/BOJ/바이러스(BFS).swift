let n = Int(readLine()!)! // 컴퓨터의 수
let m = Int(readLine()!)! // node 수

var graph = [[Int]](repeating: [Int](repeating: 0, count: 0), count: n + 1)
var visited = [Bool](repeating: false, count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

// BFS
var queue = [1]
var index = 0

while queue.count > index {
    let node = queue[index]
    visited[node] = true
    for nextNode in graph[node] {
        if !visited[nextNode] {
            queue.append(nextNode)
        }
    }
    index += 1
}

// 1번 빼고 방문한 노드의 갯수 출력
print(visited.filter { $0 == true }.count - 1)