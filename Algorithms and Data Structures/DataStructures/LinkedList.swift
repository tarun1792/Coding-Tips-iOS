//
//  LinkedList.swift
//  
//
//  Created by Tarun Kaushik on 23/04/20.
//

import Foundation

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


/*********************************************************
 *  LINKED LISTS QUESTIONS
 *********************************************************/
 
/* WAP to remove duplicates from and unsorted linked list */

class Node1{
    var next:Node1?
    var data:Int?
    
    init(data:Int){
        self.data = data
    }
    
    func appendToTail(data:Int){
        let newNode = Node1(data: data)
        var n = self
        while(n.next != nil){
          n = n.next!
        }
        n.next = newNode
    }
    
    func printList(){
        var string = "start->"
        var n = self
        while(n.next != nil){
            string += "\(n.data ?? -1)->"
            n = n.next!
        }
        string += "\(n.data ?? -1)->"
        string += "finished"
        
        print(string)
    }
}

// lets create a linked list

let  head = Node1(data: 1)
head.appendToTail(data: 2)
head.appendToTail(data: 3)
head.appendToTail(data: 4)
head.printList()
