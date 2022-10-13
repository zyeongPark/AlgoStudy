import Foundation

class Node1<T: Equatable> {
    let id: Int
    let data: T
    var next: Node1?
    
    init(id: Int, data: T, next: Node1? = nil) {
        self.id = id
        self.data = data
        self.next = next
    }
}

struct LinkedList<T: Equatable> {
    var head: Node1<T>?
    var tail: Node1<T>?
    
    mutating func add(node: Node1<T>) {
        // head가 없다면 현재 추가되는 값으로 노드를 초기화
        if head == nil {
            head = node
            tail = node
            return
        }
        
        // 값이 있다면 맨 마지막에 추가
        tail?.next = node
        tail = node
    }
    
    func searchNode1(with data: T) -> Node1<T>? {
        var now = head
    
        // 동일한 값을 찾을 때 까지 next값을 다음으로 넘어가며 탐색
        while now?.data != data && now != nil {
            now = now?.next
        }
        return now
    }
    
    mutating func insert(node: Node1<T>, after id: Int) {
        var now = head
        while now?.id != id && now?.next != nil {
            now = now?.next
        }
        node.next = now?.next
        now?.next = node
    }
    
    mutating func insert(node: Node1<T>, before id: Int) {
        var now = head
        
        if now?.id == id {
            head = node
            node.next = now
            return
        }
        
        while now?.next?.id != id && now?.next != nil {
            now = now?.next
        }
        
        node.next = now?.next
        now?.next = node
    }
    
    mutating func delete(node: Node1<T>) -> Bool {
        var now = self.head
        
        if now === node {
            if self.head === self.tail { self.tail = nil }
            self.head = now?.next
            return true
        }
        
        while now?.next !== node && now?.next != nil {
            now = now?.next
        }
        
        if now == nil { return false }
        
        if now?.next === tail {
            tail = now
        }
        
        now?.next = now?.next?.next
        return true
    }
    
    func showList() {
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
