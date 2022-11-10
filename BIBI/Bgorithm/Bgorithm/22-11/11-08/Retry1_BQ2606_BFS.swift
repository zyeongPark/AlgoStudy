
// MARK: - BQ2606 2) Feedback 1 - removeFirst 대신 index 사용

let total = Int(readLine()!)! // 컴퓨터의 총 수량, 0~100
let n = Int(readLine()!)! // 직접 연결되어 있는 컴퓨터 쌍의 수
var graph: [[Int]] = Array(repeating: [], count: total + 1)
var visited: [Bool] = Array(repeating: false, count: total + 1)
var count = 0

for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    graph[b].append(a)
}

print("======================= 전체 그래프 =======================")
print(graph)
print("========================================================")
print()

var queue = [1]
var index = 0

func bfs() {
    while queue.count > index {
        print("<< BFS (\(index)) >>")
        
        let now = queue[index]
        visited[now] = true
        
        print(" * 현재 방문중인 \(now)의 인접리스트 : \(graph[now]) ")
        print()
        
        for next in graph[now] {
            print(">> 다음 방문할 \(next)의 방문 여부 : \(visited[next])")
            
            if !visited[next] {
                queue.append(next)
                count += 1
            }
            
            print(">> append 여부 : \(!visited[next] ? "Y" : "N") ==> \(queue)")
            print()
        }
        index += 1
    }
    
}

bfs()
print(visited)
print(visited.filter { $0 == true }.count - 1)

/*
 [출력결과]
 ======================= 전체 그래프 =======================
 [[], [2, 5], [1, 3, 5], [2], [7], [1, 2, 6], [5], [4]]
 ========================================================
 
 << BFS (0) >>
 * 현재 방문중인 1의 인접리스트 : [2, 5]
 
 >> 다음 방문할 2의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2]
 
 >> 다음 방문할 5의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2, 5]
 
 << BFS (1) >>
 * 현재 방문중인 2의 인접리스트 : [1, 3, 5]
 
 >> 다음 방문할 1의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5]
 
 >> 다음 방문할 3의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2, 5, 3]
 
 >> 다음 방문할 5의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2, 5, 3, 5]
 
 << BFS (2) >>
 * 현재 방문중인 5의 인접리스트 : [1, 2, 6]
 
 >> 다음 방문할 1의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5]
 
 >> 다음 방문할 2의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5]
 
 >> 다음 방문할 6의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2, 5, 3, 5, 6]
 
 << BFS (3) >>
 * 현재 방문중인 3의 인접리스트 : [2]
 
 >> 다음 방문할 2의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5, 6]
 
 << BFS (4) >>
 * 현재 방문중인 5의 인접리스트 : [1, 2, 6]
 
 >> 다음 방문할 1의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5, 6]
 
 >> 다음 방문할 2의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5, 6]
 
 >> 다음 방문할 6의 방문 여부 : false
 >> append 여부 : Y ==> [1, 2, 5, 3, 5, 6, 6]
 
 << BFS (5) >>
 * 현재 방문중인 6의 인접리스트 : [5]
 
 >> 다음 방문할 5의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5, 6, 6]
 
 << BFS (6) >>
 * 현재 방문중인 6의 인접리스트 : [5]
 
 >> 다음 방문할 5의 방문 여부 : true
 >> append 여부 : N ==> [1, 2, 5, 3, 5, 6, 6]
 
 [false, true, true, true, false, true, true, false]
 4
 */

/*
 [제출코드]
let total = Int(readLine()!)!
let n = Int(readLine()!)!
var graph: [[Int]] = Array(repeating: [], count: total + 1)
var visited: [Bool] = Array(repeating: false, count: total + 1)
var count = 0
for _ in 0 ..< n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (a, b) = (input[0], input[1])
    graph[a].append(b)
    graph[b].append(a)
}
var queue = [1]
var index = 0
func bfs() {
    while queue.count > index {
        let now = queue[index]
        visited[now] = true
        for next in graph[now] {
            if !visited[next] {
                queue.append(next)
                count += 1
            }
        }
        index += 1
    }
}
bfs()
print(visited.filter { $0 == true }.count - 1)
 */
