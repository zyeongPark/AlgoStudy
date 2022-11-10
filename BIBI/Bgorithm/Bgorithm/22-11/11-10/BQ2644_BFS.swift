let total = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let (start, end) = (input[0], input[1])
let m = Int(readLine()!)!

var graph: [[Int]] = Array(repeating: [], count: total + 1)

for _ in 0 ..< m {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (x, y) = (line[0], line[1])
    graph[x].append(y)
    graph[y].append(x)
}

var depth = Array(repeating: 0, count: total + 1)

func bfs(_ start: Int) -> Int {
    let queue = Queue<Int>()
    queue.enqueue(start)
    while !queue.isEmpty {
        let now = queue.dequeue() ?? 0
        for next in graph[now] {
            if depth[next] == 0 {
                depth[next] = depth[now] + 1
                queue.enqueue(next)
            }
        }
    }
    return depth[end] > 0 ? depth[end] : -1
}

print(bfs(start))

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
