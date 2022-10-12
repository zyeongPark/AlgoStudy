
/* [DAY32] Queue 자료구조 구현해서 풀기 */
// [백준] 24444. 알고리즘 수업 - 너비 우선 탐색 1
struct Queue_1<T> {
    var queue: [T?] = []
    var head: Int = 0

    public var count: Int {
        return queue.count
    }
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    public mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        return element
    }
}

let input1 = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n1, m1, r1) = (input1[0], input1[1], input1[2])

var graph1: [[Int]] = Array(repeating: [], count: n1+1)
var visited1 = Array(repeating: 0, count: n1+1)

for _ in 0..<m1 {
    let tmp = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[tmp[0]].append(tmp[1])
    graph[tmp[1]].append(tmp[0])
}

visited[r1] = 1
var count = 2
var queue = Queue_1<Int>()
queue.enqueue(r1)

while queue.head < queue.count {
    let v = queue.dequeue() ?? 0
    graph[v].sort()
    for i in graph[v] {
        if visited[i] == 0 {
            visited[i] = count
            count += 1
            queue.enqueue(i)
        }
    }
}

for i in 1..<visited.count {
    print(visited[i])
}

/* [DAY33] Queue 자료구조 구현해서 풀기 */
// [백준] 24445. 알고리즘 수업 - 너비 우선 탐색 2
struct Queue_2<T> {
    var queue: [T?] = []
    var head: Int = 0

    public var count: Int {
        return queue.count
    }
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    public mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        return element
    }
}

let input2 = readLine()!.split(separator: " ").map { Int(String($0))! }
let (n2, m2, r2) = (input2[0], input2[1], input2[2])

var graph2: [[Int]] = Array(repeating: [], count: n2+1)
var visited2 = Array(repeating: 0, count: n2+1)

for _ in 0..<m2 {
    let tmp = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[tmp[0]].append(tmp[1])
    graph[tmp[1]].append(tmp[0])
}

visited[r2] = 1
var count2 = 2
var queue2 = Queue_2<Int>()
queue.enqueue(r2)

while queue.head < queue.count {
    let v = queue.dequeue() ?? 0
    graph[v].sort(by: >)
    for i in graph[v] {
        if visited[i] == 0 {
            visited[i] = count
            count += 1
            queue.enqueue(i)
        }
    }
}

for i in 1..<visited.count {
    print(visited[i])
}

/* [DAY33] Queue 자료구조 구현해서 풀기 */
// [백준] 24446. 알고리즘 수업 - 너비 우선 탐색 3
struct Queue_3<T> {
    var queue: [T?] = []
    var head: Int = 0

    public var count: Int {
        return queue.count - head
    }

    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    public mutating func dequeue() -> T? {
        guard head < queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        return element
    }
}

let input = readLine()!.split(separator: " ").map{ Int($0)! }
let (N, M, R) = (input[0], input[1], input[2])
var graph: [[Int]] = Array(repeating: [], count: N+1)
var visited = Array(repeating: -1, count: N+1)

for _ in 0..<M {
    let tmp = readLine()!.split(separator: " ").map{ Int($0)! }
    graph[tmp[0]].append(tmp[1])
    graph[tmp[1]].append(tmp[0])
}

var Q = Queue_3<Int>()
Q.enqueue(R)
visited[R] = 0
var depth = 0
var Qsize = 0

while Q.head < Q.queue.count {
    depth += 1
    Qsize = Q.count
    
    for _ in 0 ..< Qsize {
        let v = Q.dequeue()!
        graph[v].sort()
        
        for i in graph[v] {
            if visited[i] == -1 {
                visited[i] = depth
                Q.enqueue(i)
            }
        }
    }
}

for i in 1...N {
    print(visited[i])
}
