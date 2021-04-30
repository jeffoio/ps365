//
//  1991.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/29.
//
//  트리 순회
//  https://www.acmicpc.net/problem/1991

let n = Int(readLine()!)!
var lcr = "", clr = "", lrc = ""
var tree = [String: (left: String, right: String)]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    tree[input[0]] = (input[1], input[2])
}

func k(node: String, pos: Int) -> String {
    if node == "." {
        return ""
    }
    
    let left = k(node: tree[node]!.left, pos: pos)
    let right = k(node: tree[node]!.right, pos: pos)
    
    if pos == 0 {
        return node + left + right
    } else if pos == 1 {
        return left + node + right
    } else {
        return left + right + node
    }
}

print(k(node: "A", pos: 0))
print(k(node: "A", pos: 1))
print(k(node: "A", pos: 2))
