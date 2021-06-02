//
//  1021.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/02.
//
//  회전하는 큐
//  https://www.acmicpc.net/problem/1021

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var pickNumbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var q = Array(1...n)
var moveCount = 0

for pick in pickNumbers {
    let rightMove = q.firstIndex(of: pick)!
    let leftMove = q.count - rightMove
    moveCount += min(rightMove, leftMove)
    
    let nextStart = q.index(after: rightMove)
    q = q[nextStart...].map{Int($0)} + q[..<rightMove].map{Int($0)}
}

print(moveCount)
