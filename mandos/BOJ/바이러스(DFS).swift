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

// DFS
func dfs(node: Int) {
    visited[node] = true
    print(node)
    for nextNode in graph[node] {
        if !visited[nextNode] {
            dfs(node: nextNode)
        }
    }
}
dfs(node: 1)

// 1번 빼고 방문한 노드의 갯수 출력
print(visited.filter { $0 == true }.count - 1)
