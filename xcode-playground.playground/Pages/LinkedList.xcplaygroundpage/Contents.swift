//: [Previous](@previous)

import Foundation

class Node<T: Equatable>{
    var value: T
    var next: Node?
    
    init(value: T, next: Node? = nil){
        self.value = value
        self.next = next
    }
}


class LinkedList<T: Equatable>{
    var head: Node<T>?
    
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
    func append(value: T){
        let node = Node(value: value)
        if head == nil {
            head = node
        }else{
            var tail = head
            while tail?.next != nil {
                tail = tail?.next
            }
            tail?.next = node
            
        }
    }
    
    func removeByPosition(index: Int){
        if head == nil { return }
        var count: Int = 0
        
    }
    
    func removeByValue(value: T){
      
        if head == nil { return }
        
        if head?.value == value {
            head = head?.next
        }
        
        var current = head
        var previous = head
        while current != nil{
            if current?.value == value{
                previous?.next = current?.next
                return
            }
            previous = current
            current = current?.next
            
        }
    }
    
    func printReverseRecursive(){
        
        recursiveReverse(node: head)
    }
    
    func printReverseNonRecursive(){
        
        var stack = [T]()
        var node = head
        
        while node != nil{
            stack.append(node!.value)
            node = node?.next
        }
        
        while !stack.isEmpty{
            print(stack.removeLast())
        }
        
        
        
    }

    
    func printNodesNonRecursive(){
        
        print("print nodes")
        var node = head
        while node != nil {
            if let unwrappedNode = node{
                print(unwrappedNode.value)
            }
            
            node = node?.next
        }
    }
    
    func printNodesRecursive(){
        
       recursive(node: head)
    }
    
    private func recursive(node: Node<T>?){
        guard var inputNode = node else{ return }
        print(inputNode.value)
        recursive(node: inputNode.next)
        
    }
    
    private func recursiveReverse(node: Node<T>?){
        guard var inputNode = node else{ return }
        
        recursive(node: inputNode.next)
        print(inputNode.value)
        
    }
}

let linkedList = LinkedList<Int>()

linkedList.append(value: 5)
linkedList.append(value: 7)
linkedList.append(value: 9)





linkedList.head?.next?.value




