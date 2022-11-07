import Foundation

private class structOfLinkedList {
    
    class Node<T: Equatable> {
        let id: Int
        let data: T
        var next: Node?
        
        init(id: Int, data: T, next: Node? = nil) {
            self.id = id
            self.data = data
            self.next = next
        }
    }
    
    struct LinkedList<T: Equatable> {
        var head: Node<T>?
        var tail: Node<T>?
        
        mutating func add(node: Node<T>) {
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
        
        func searchNode(with data: T) -> Node<T>? {
            var now = head
            
            // 동일한 값을 찾을 때 까지 next값을 다음으로 넘어가며 탐색
            while now?.data != data && now != nil {
                now = now?.next
            }
            return now
        }
        
        mutating func insert(node: Node<T>, after id: Int) {
            var now = head
            while now?.id != id && now?.next != nil {
                now = now?.next
            }
            node.next = now?.next
            now?.next = node
        }
        
        mutating func insert(node: Node<T>, before id: Int) {
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
        
        mutating func delete(node: Node<T>) -> Bool {
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
    
}
