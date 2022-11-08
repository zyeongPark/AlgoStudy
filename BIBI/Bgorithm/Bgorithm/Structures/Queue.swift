
private class structOfQueue1 {
    // removeFirst() 사용 -> dequeue시간복잡도 O(n)
    struct Queue<Item> {
        private var items: [Item] = []
        
        // isEmpty
        func isEmpty() -> Bool {
            return items.isEmpty ? true : false
        }
        
        // Enqueue
        mutating func enqueue(item: Item) {
            items.append(item)
        }
        
        // Dequeue
        mutating func dequeue() -> Item {
            guard !items.isEmpty else { fatalError("The queue is empty!") }
            return items.removeFirst()
        }
        
        // Head
        var head: Item {
            guard let firstItem = items.first else { fatalError("The queue is empty!") }
            return firstItem
        }
        
        // Tail
        var tail: Item {
            guard let lastItem = items.last else { fatalError("The queue is empty!") }
            return lastItem
        }
    }
    
}

private class structOfQueue2 {
    
    // head(index) += 1 방식의 dequeue -> 메모리 누수 문제 있음
    struct Queue<T> {
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
}

private class structOfQueue3 {

    // reversed() -> removeAll() 방식의 dequeue
    struct Queue {
      private var enqueue: [Int] = []
      private var dequeue: [Int] = []
      
      var isEmtpy: Bool { enqueue.isEmpty && dequeue.isEmpty }
      
      mutating func push(_ elem: Int) {
        enqueue.append(elem)
      }
      
      mutating func pop() -> Int? {
        if dequeue.isEmpty {
          dequeue = enqueue.reversed()
          enqueue.removeAll()
        }
        return dequeue.popLast()
      }
    }
}


private class structOfLinkedListQueue {
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
}
