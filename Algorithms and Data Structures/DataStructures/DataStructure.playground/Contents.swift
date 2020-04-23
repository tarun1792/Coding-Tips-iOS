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

/*********************************************************
*  Tree
*********************************************************/

class TreeNode<T>{
    var value:T
    
    weak var parent:TreeNode?
    var children = [TreeNode<T>]()
    
    init(value:T){
        self.value = value
    }
    
    func addChild(_ node : TreeNode<T>){
        children.append(node)
        node.parent = self
    }
    
}

extension TreeNode:CustomStringConvertible{
    var description: String {
        var des = "\(value)"
        
        if !children.isEmpty{
            des += " {" + children.map({$0.description}).joined(separator: ",") + "} "
        }
        
        return des
    }
}

/* example beverage
        hot     cold
 coffee tea     lemonade milkshake
 */

let tree = TreeNode<String>(value: "Beverage")

let hotNode = TreeNode<String>(value: "Hot")
let coldNode = TreeNode<String>(value: "Cold")

// Hot nodes
let coffee = TreeNode<String>(value: "Coffee")
let tea = TreeNode<String>(value: "Tea")

// Cold node
let lemonade = TreeNode<String>(value: "Lemonade")
let milkshake = TreeNode<String>(value: "MilkShake")

tree.addChild(hotNode)
tree.addChild(coldNode)

// add hot childs
hotNode.addChild(coffee)
hotNode.addChild(tea)

// add cold childs
coldNode.addChild(lemonade)
coldNode.addChild(milkshake)

print(tree.description)

/*********************************************************
*  Binary Tree
*********************************************************/

/*
         10
        /  \
       5    14
      /    /  \
     1    11   20
 */

class BinaryNode{
    weak var parent:BinaryNode?
    let value:Int
    var leftChild:BinaryNode
    var rightChild:BinaryNode
    
    init(value:Int,leftChild:BinaryNode,rightChild:BinaryNode) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
    
}
