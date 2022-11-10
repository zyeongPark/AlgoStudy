
// MARK: - BQ2606 3) Feedback 2 - 연결리스트형 큐 struct 사용

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

func bfs(_ v: Int) {
    var queue: Queue<Int> = [1]
    visited[v] = true
    while !queue.isEmpty {
        let now = queue.dequeue()
        for next in graph[v] {
            if !visited[next] {
                queue.enqueue(next)
                count += 1
            }
        }
    }
}

print(count)

// MARK: - Linked List
// https://woongsios.tistory.com/222
final class LinkedList<T> {
    
    final class Node<T> {
        var value: T
        var next: Node?
        weak var previous: Node?
        
        init(_ value: T) {
            self.value = value
        }
    }
    
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count = 0
    
    var first: T? {
        return head?.value
    }
    
    var last: T? {
        return tail?.value
    }
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func node(at index: Int) -> Node<T>? {
        guard 0..<count ~= index else { return nil }
        
        var node = head!
        var current = 0
        while index > current, let next = node.next {
            node = next
            current += 1
        }
        return node
    }
    
    func append(value: T) {
        let newNode = Node(value)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        
        if count == 1 {
            head?.next = tail
        }
        
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
        count += 1
    }
    
    func insert(_ value: T, at index: Int) {
        let node = Node(value)
        
        
        if index == 0 {
            // 1) 맨 처음 insert 하는 경우
            node.next = head
            head?.previous = node
            head = node
            count += 1
        } else if index == count {
            // 2) 맨 마지막에 insert 하는 경우
            append(value: value)
        } else {
            // 3) 중간에 insert 하는 경우
            // index가 범위를 벗어나면 에러메세지 출력
            assert(0..<count ~= index, "Out of Index: \(index), range: \(0)..<\(count)")
            let next = self.node(at: index)
            let before = next?.previous
            node.previous = before
            node.next = next
            before?.next = node
            next?.previous = node
            count += 1
        }
    }
    
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    @discardableResult
    func remove(node: Node<T>) -> T {
        if node === head, node === tail {
            head = nil
            tail = nil
            return node.value
        } else if node === head {
            defer { // * defer : 가장 마지막에 실행
                head = node.next
                head?.previous = nil
            }
            return node.value
        } else if node === tail {
            defer {
                tail?.previous = tail
                tail?.next = nil
            }
            return node.value
        } else {
            let before = node.previous
            let next = node.next
            before?.next = next
            next?.previous = before
            node.next = nil
            node.previous = nil
            count -= 1
            return node.value
        }
    }
    
    @discardableResult
    func remove(at index: Int) -> T? {
        assert(0..<count ~= index, "Out of Index: \(index), range: \(0)..<\(count)")
        guard let node = node(at: index) else { return nil }
        return remove(node: node)
    }
    
}

extension LinkedList.Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + "\(next)" + " "
    }
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "List is Empty"
        }
        return "\(head)"
    }
}

// MARK: - Queue

struct Queue<T> {
    private var list = LinkedList<T>()
    
    var count: Int {
        return list.count
    }
    
    var isEmpty: Bool {
        return list.isEmpty
    }
    
    var front: T? {
        return list.first
    }
    
    var last: T? {
        return list.last
    }
    
    func enqueue(_ element: T) {
        list.append(value: element)
    }
    
    func dequeue() -> T? {
        guard !list.isEmpty else { return nil }
        return list.remove(at: 0)
    }
}

extension Queue: CustomStringConvertible {
    var description: String {
        return list.description
    }
}

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
var queue = Queue<Int>()
queue.enqueue(1)
func bfs() {
    while !queue.isEmpty {
        let now = queue.dequeue()
        visited[now ?? 0] = true
        for next in graph[now ?? 0] {
            if !visited[next] {
                queue.enqueue(next)
                count += 1
            }
        }
    }
}
bfs()
print(visited.filter { $0 == true }.count - 1)
final class LinkedList<T> {
    final class Node<T> {
        var value: T
        var next: Node?
        weak var previous: Node?
        init(_ value: T) {
            self.value = value
        }
    }
    private(set) var head: Node<T>?
    private(set) var tail: Node<T>?
    private(set) var count = 0
    var first: T? {
        return head?.value
    }
    var last: T? {
        return tail?.value
    }
    var isEmpty: Bool {
        return head == nil
    }
    func node(at index: Int) -> Node<T>? {
        guard 0..<count ~= index else { return nil }
        var node = head!
        var current = 0
        while index > current, let next = node.next {
            node = next
            current += 1
        }
        return node
    }
    func append(value: T) {
        let newNode = Node(value)
        guard !isEmpty else {
            head = newNode
            tail = newNode
            count += 1
            return
        }
        if count == 1 {
            head?.next = tail
        }
        tail?.next = newNode
        newNode.previous = tail
        tail = newNode
        count += 1
    }
    func insert(_ value: T, at index: Int) {
        let node = Node(value)
        if index == 0 {
            node.next = head
            head?.previous = node
            head = node
            count += 1
        } else if index == count {
            append(value: value)
        } else {
            assert(0..<count ~= index, "Out of Index: \(index), range: \(0)..<\(count)")
            let next = self.node(at: index)
            let before = next?.previous
            node.previous = before
            node.next = next
            before?.next = node
            next?.previous = node
            count += 1
        }
    }
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    @discardableResult
    func remove(node: Node<T>) -> T {
        if node === head, node === tail {
            head = nil
            tail = nil
            return node.value
        } else if node === head {
            defer {
                head = node.next
                head?.previous = nil
            }
            return node.value
        } else if node === tail {
            defer {
                tail?.previous = tail
                tail?.next = nil
            }
            return node.value
        } else {
            let before = node.previous
            let next = node.next
            before?.next = next
            next?.previous = before
            node.next = nil
            node.previous = nil
            count -= 1
            return node.value
        }
    }
    @discardableResult
    func remove(at index: Int) -> T? {
        assert(0..<count ~= index, "Out of Index: \(index), range: \(0)..<\(count)")
        guard let node = node(at: index) else { return nil }
        return remove(node: node)
    }
}
struct Queue<T> {
    private var list = LinkedList<T>()
    var count: Int {
        return list.count
    }
    var isEmpty: Bool {
        return list.isEmpty
    }
    var front: T? {
        return list.first
    }
    var last: T? {
        return list.last
    }
    func enqueue(_ element: T) {
        list.append(value: element)
    }
    func dequeue() -> T? {
        guard !list.isEmpty else { return nil }
        return list.remove(at: 0)
    }
}
 */
