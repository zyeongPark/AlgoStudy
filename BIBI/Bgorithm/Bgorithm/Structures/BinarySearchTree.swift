private class structOfBinarySearchTree {
    // 1. Node 클래스 생성
    class Node<T: Comparable> { // Comparable : 비교가 가능한 데이터만 저장
        var data: T             // Non-Optional Type : 데이터는 항상 존재
        var left: Node?         // Optional Type : 자식 노드는 존재하지 않을 수 있음
        var right: Node?
        
        init(data: T) {
            self.data = data
        }
    }

    // 2. 이진 탐색 트리 클래스 생성
    class BinarySearchTree<T: Comparable> {
        var root: Node<T>? // 최상위 노드
        
        func insert(_ data: T) {
            guard let root = self.root else {
                return self.root = Node.init(data: data)
            }
            
            var currentNode = root
            while true {
                if currentNode.data > data {
                    guard let nextNode = currentNode.left else {
                        return currentNode.left = Node.init(data: data)
                    }
                    currentNode = nextNode
                } else {
                    guard let nextNode = currentNode.right else {
                        return currentNode.right = Node.init(data: data)
                    }
                    currentNode = nextNode
                }
            }
        }
        
        func search(from data: T) -> Bool {
            if root == nil { return false }
            
            var currntNode = root
            while let node = currntNode {
                if node.data == data {
                    return true
                }
                if node.data > data {
                    currntNode = node.left
                } else {
                    currntNode = node.right
                }
            }
            return false
        }
        
        func remove(from data: T) -> Bool {
            guard let root = self.root, root.data != data else { return false }
            
            var parentNode = root
            var currentNode: Node? = root
            
            // 삭제할 노드 탐색
            while let node = currentNode {
                if node.data == data {
                    break
                }
                if node.data > data {
                    currentNode = node.left
                } else {
                    currentNode = node.right
                }
                parentNode = node
            }
            
            guard let deleteNode = currentNode else {
                return false // 탐색실패
            }
            
            // 1) 자식이 없는 Leaf Node 삭제
            if (deleteNode.left == nil) && (deleteNode.right == nil) {
                if parentNode.data > data {
                    parentNode.left = nil
                } else {
                    parentNode.right = nil
                }
                return true
            }
            
            // 2) 자식이 1개 있는 노드 삭제
            if (deleteNode.left != nil) && (deleteNode.right == nil) { // 왼쪽 자식 노드가 존재할 경우
                if parentNode.data > data {
                    parentNode.left = deleteNode.left
                } else {
                    parentNode.right = deleteNode.left
                }
                return true
            }
            if (deleteNode.left == nil) && (deleteNode.right != nil) { // 오른쪽 자식 노드가 존재할 경우
                if parentNode.data > data {
                    parentNode.left = deleteNode.right
                } else {
                    parentNode.right = deleteNode.right
                }
                return true
            }
            
            // 3) 자식 노드가 2개 있는 경우
            guard let rightNode = deleteNode.right else { return false }
            
            var changeNode = rightNode
            var changeParentNode = rightNode
            
            while let nextNode = changeNode.left { // 오른쪽 자식 노드의 맨 왼쪽 값을 찾는다
                changeParentNode = changeNode
                changeNode = nextNode
            }
            
            if let changeChildNode = changeNode.right { // changeNode 에 오른쪽 값이 존재한다면
                changeParentNode.left = changeChildNode
            } else {
                changeParentNode.left = nil
            }
            
            if parentNode.data > data {
                parentNode.left = changeNode
            } else {
                parentNode.right = changeNode
            }
            
            // Delete Node의 왼쪽, 오른쪽 자식을 changeNode에게 이식
            changeNode.left = deleteNode.left
            changeNode.right = deleteNode.right
            
            return true
        }
        
        func drawDiagram() {
            print(diagram(for: self.root))
        }
         
        private func diagram(for node: Node<T>?,
                             _ top: String = "",
                             _ root: String = "",
                             _ bottom: String = "") -> String {
           guard let node = node else {
                return root + "nil\n"
            }
            if node.left == nil && node.right == nil {
                return root + "\(node.data)\n"
            }
            return diagram(for: node.right, top + " ", top + "┌──", top + "│ ")
                + root + "\(node.data)\n"
                + diagram(for: node.left, bottom + "│ ", bottom + "└──", bottom + " ")
        }
    }

    let BST = BinarySearchTree<Int>()
//    BST.insert(20)
//    BST.insert(15)
//    BST.insert(30)
//    BST.insert(12)
//    BST.insert(16)
//    BST.insert(37)
//
//    BST.drawDiagram()
//
//    print(BST.search(from: 20))
//    print(BST.search(from: 13))
//    print(BST.search(from: 50))
//    print(BST.search(from: 15))
//
//    BST.remove(from: 30)
//
//    BST.drawDiagram()

}
