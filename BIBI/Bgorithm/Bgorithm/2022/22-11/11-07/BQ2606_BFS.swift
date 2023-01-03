
// MARK: - BQ2606 1) 첫 제출

let total = Int(readLine()!)! // 컴퓨터의 총 수량, 0~100
let n = Int(readLine()!)! // 직접 연결되어 있는 컴퓨터 쌍의 수
var graph: [[Int]] = Array(repeating: Array(repeating: 0, count: total + 1), count: total + 1)
var visited: [Bool] = Array(repeating: false, count: total + 1)
var count = 0

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a, b) = (input[0], input[1])
    graph[a][b] = 1
    graph[b][a] = 1
}

print(graph)
print(visited)

func bfs(_ v: Int) {
    visited[v] = true
    var queue = [1]
    while !queue.isEmpty {
        let now = queue.removeFirst()
        for i in 1 ... total {
            if graph[i][now] == 1 && visited[i] == false {
                queue.append(i)
                visited[i] = true
                count += 1
            }
        }
    }
}

bfs(1)
print(count)

// MARK: - Feedback on 22.11.08.TUE
/*
    1) 인접리스트방식 + removeFirst 대신 index 사용
    2) 연결리스트형 큐 struct 사용
    두가지 방법으로 시간 복잡도 줄일 수 있음
    * swift 컨벤션 참고 : https://github.com/StyleShare/swift-style-guide#%EC%B5%9C%EB%8C%80-%EC%A4%84-%EA%B8%B8%EC%9D%B4
 */
