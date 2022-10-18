import Foundation
public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool
    var isEmpty: Bool {
        return nodes.isEmpty
    }
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    func peek() -> T? {
        return nodes.first
    }
    mutating func insert(_ element: T) {
        var index = nodes.count
        nodes.append(element)
        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2 }
    }
    mutating func delete() -> T? {
        guard !nodes.isEmpty else { return nil }
        if nodes.count == 1 {
            return nodes.removeFirst()
        }
        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()
        var index = 0
        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1
            if right < nodes.count {
                if comparer(nodes[left], nodes[right]), !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else { break }
                
            } else { break }
        }
        return result
    }
}
extension Heap where T: Comparable {
    init() { self.init(comparer: >) }
}

struct Data: Comparable {
    static func < (lhs: Data, rhs: Data) -> Bool { lhs.cost < rhs.cost }
    var cost : Int
    var node : Int
}

// 노드(n), 간선(m) 갯수 입력 받기
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]

// 시작 노드 번호
let start = Int(readLine()!)!

// 각 노드에 연결되어 있는 노드에 대한 정보를 담는 배열
var graph = [[(node: Int, cost: Int)]](repeating: [(node: Int, cost: Int)](repeating: (node: 0, cost: 0), count: 0), count: n + 1)

// 최단거리 테이블
let INF = 1_000_000_000
var distance = [Int](repeating: INF, count: n + 1)

// 간선의 정보 입력받기
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0], node = input[1], cost = input[2]
    graph[a].append((node: node, cost: cost))
}

func dijkstra(start: Int) {
    var pq = Heap<Data>()
    
    // 시작 노드 -> 시작 노드 경로는 0으로 셋팅
    pq.insert(Data(cost: 0, node: start))
    distance[start] = 0
    
    while !pq.isEmpty {
        // 가장 최단 거리 짧은 노드의 정보 꺼냄
        let now = pq.delete()!
        
        // 이미 처리된 노드라면 무시
        if distance[now.node] < now.cost {
            continue
        }
        
        // 현재 노드와 연결된 다른 인접한 노드들을 확인
        for i in graph[now.node] {
            let cost = now.cost + i.cost
            
            if cost < distance[i.node] {
                distance[i.node] = cost
                pq.insert(Data(cost: cost, node: i.node))
            }
        }
    }
}

dijkstra(start: start)

distance.dropFirst().forEach {
    $0 == INF ? print("INF") : print($0)
}

