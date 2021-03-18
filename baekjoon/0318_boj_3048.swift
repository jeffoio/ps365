//
//  0318_boj_3048.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  개미
//  
var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
var groupA = Array(Array(readLine()!).map{ (String($0), 2)}.reversed())
var groupB = Array(readLine()!).map{ (String($0), 1)}
let time = Int(readLine()!)!
var order = groupA + groupB


for _ in 0..<time {
    var change = [Int]()
    for i in 0...order.count - 2 {
        if order[i].1 > order[i+1].1 {
            change.append(i)
        }
    }
    if !change.isEmpty {
        for i in change { order.swapAt(i, i+1)}
    }
}

for char in order {
    print(char.0, terminator: "")
}
