//
//  Tree.swift
//  
//
//  Created by Tarun Kaushik on 23/04/20.
//

import Foundation

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
