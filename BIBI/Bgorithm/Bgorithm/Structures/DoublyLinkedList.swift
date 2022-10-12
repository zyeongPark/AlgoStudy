import Foundation

class Node2<T: Equatable> {
    let id: Int
    let data: T
    var next: Node2? = nil
    var prev: Node2? = nil
    
    init(id: Int, data: T) {
        self.id = id
        self.data = data
    }
}

struct DoublyLinkedList<T: Equatable> {
    var head: Node2<T>?
    var tail: Node2<T>?
    
    var front: Node2<T>? {
        return head
    }
    
    var back: Node2<T>? {
        return tail
    }
    
    mutating func add(node: Node2<T>) {
        if self.head == nil {
            self.head = node
            self.tail = node
            return
        }
        
        self.tail?.next = node
        node.prev = self.tail
        self.tail = node
    }
    
    mutating func searchNode(with data: T) -> Node2<T>? {
        var now = self.head
        while now?.data != data && now !== tail {
            now = now?.next
        }
        return now
    }
    
    func showAll() {
        var now = head
        print("---- Linked List ----")
        while now != nil {
            now?.next == nil
            ? print("id: \(now?.id) | data: \(now?.data)")
            : print("id: \(now?.id) | data: \(now?.data) ->")
            now = now?.next
        }
        print("---------------------")
    }
}
