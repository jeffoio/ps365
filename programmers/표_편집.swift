//
//  표_편집.swift
//  codingtest
//
//  Created by jeff on 2021/07/25.
//
//  표 편집
//  https://programmers.co.kr/learn/courses/30/lessons/81303

import Foundation

class Node {
    var value: Int
    var previous: Node?
    var next: Node?
    
    init(value: Int) {
        self.value = value
    }
}
class LinkedList {
    var head: Node?
    var tail: Node?
    
    func isEmpty() -> Bool {
        return head == nil
    }
    
    func insert(value: Int) {
        let node = Node(value: value)
        
        if isEmpty() {
            head = node
            tail = head
        } else {
            tail?.next = node
            node.previous = tail
            tail = node
        }
    }
    
    func remove(node: Node) -> Node{
        let pre = node.previous
        let next = node.next
        
        if let pre = pre {
            pre.next = next
        } else {
            head = next
        }
        
        if let next = next {
            next.previous = pre
            return next
        } else {
            tail = pre
            return tail!
        }
    }
    
    func reInsert(node: Node) {
        let pre = node.previous
        let next = node.next
        
        if let pre = pre {
            pre.next = node
        } else {
            head?.previous = node
            head = node
        }
        
        if let next = next {
            next.previous = node
        } else {
            tail?.next = node
            tail = node
        }
    }
}



func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    let linkedList = LinkedList()
    var currentNode: Node?
    var removedNode = [Node?]()
    for i in 0..<n {
        linkedList.insert(value: i)
        if i == k { currentNode = linkedList.tail! }
    }
    
    for c in cmd {
        let input = c.split(separator: " ").map{String($0)}
        let command = input[0]
        
        switch command {
        case "D":
            var move = Int(input[1])!
            while move != 0 {
                move -= 1
                currentNode = currentNode?.next
            }
            currentNode = currentNode == nil ? linkedList.tail : currentNode
        case "U":
            var move = Int(input[1])!
            while move != 0 {
                move -= 1
                currentNode = currentNode?.previous
            }
            currentNode = currentNode == nil ? linkedList.head : currentNode
        case "C":
            removedNode.append(currentNode)
            currentNode = linkedList.remove(node: currentNode!)
        case "Z":
            linkedList.reInsert(node: removedNode.removeLast()!)
        default:
            continue
        }
    }
    
    var st = linkedList.head
    var ans = Array(repeating: "X", count: n)
    
    while st != nil {
        let v = st!.value
        ans[v] = "O"
        st = st?.next
    }
  
    return ans.joined()
}
