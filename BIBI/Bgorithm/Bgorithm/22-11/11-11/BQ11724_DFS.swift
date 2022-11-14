let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n, m) = (input[0], input[1])

var graph: [[Int]] = Array(repeating: [], count: n + 1)
var visited = Array(repeating: false, count: n + 1)
var count = 0

for _ in 0 ..< m {
    let arr = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[arr[0]].append(arr[1])
    graph[arr[1]].append(arr[0])
}

for i in 1...n { // 1부터 n번째 노드 탐색
    if !visited[i] { // 방문되어있지 않다면
        if graph[i].isEmpty { // 해당 그래프가 비어있다면
            count += 1 // 연결이 끊어져있으므로 count
            visited[i] = true // 방문 처리
        } else { // 그래프가 존재한다면
            dfs(i, 0) // 해당 그래프 dfs 탐색
            count += 1 // 한번의 실행으로 연결된 노드를 체크하므로 count
        }
    }
}

print(count)

func dfs(_ start: Int, _ depth: Int) {
    visited[start] = true // 방문체크
    for i in graph[start] { // 해당 노드를 기준으로 dfs 탐색
        if !visited[i] {
            dfs(i, depth + 1)
        }
    }
}
