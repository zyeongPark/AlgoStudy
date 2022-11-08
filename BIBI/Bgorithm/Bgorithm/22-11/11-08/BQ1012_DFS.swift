import Foundation

let testCase = Int(readLine()!)!

func dfs(_ x: Int, _ y: Int, _ map: inout [[Int]], _ m: Int, _ n: Int) {
    // 범위 밖이라면 종료
    if x < 0 || x >= n || y < 0 || y >= m || map[x][y] != 1 { return }
    
    map[x][y] = 0 // visit
    
    // 상하좌우 재귀 호출
    dfs(x+1, y, &map, m, n)
    dfs(x-1, y, &map, m, n)
    dfs(x, y+1, &map, m, n)
    dfs(x, y-1, &map, m, n)
}

for _ in 0 ..< testCase {
    let array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    let (m, n, num) = (array[0], array[1], array[2]) // 맵 가로, 맵 세로, 배추 개수
    var map = Array(repeating: Array(repeating: 0, count: m), count: n)
    var count = 0
    
    // 배추 있는 자리 1
    for _ in 0 ..< num {
        let location = readLine()!.split(separator: " ").map{ Int(String($0))! }
        map[location[1]][location[0]] = 1
    }
    
    // 땅 전부 검사하면서 1있으면 dfs 돌리기
    for i in 0 ..< n {
        for j in 0..<m {
            if map[i][j] == 1 {
                count += 1
                dfs(i, j, &map, m, n)
            }
        }
    }
    print(count)
}

// MARK: - BFS로 풀려고 했던 구조체
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
