
// removeFirst() 사용 -> dequeue시간복잡도 O(n)
struct Queue1<Item> {
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

// head(index) += 1 방식의 dequeue -> 메모리 누수 문제 있음
struct Queue2<T> {
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

// reversed() -> removeAll() 방식의 dequeue
struct Queue3 {
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
