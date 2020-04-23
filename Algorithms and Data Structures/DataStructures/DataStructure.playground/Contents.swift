//: Playground - noun: a place where people can play

import UIKit

// ++++++++++++++++++++++++++++++++++++ Linked list +++++++++++++++++++++++++++++++++++++++++++
class Node{
    var data:Int
    var next:Node?
    
    init(data:Int){
        self.data = data
    }
}

class LinkedList{
    var head:Node?
    
    func printList(){
        var next = head
        
        while(next != nil){
            print(next!.data)
            next = next!.next
        }
    }
}


func linkedList(){
    let lList = LinkedList()
    
    lList.head = Node(data: 1)
    
    let second = Node(data: 2)
    let third = Node(data: 3)
    
    lList.head?.next = second
    second.next = third
    
    lList.printList()
}

linkedList()
