//
//  0323_boj_11723.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/23.
//
//  집합
//  https://www.acmicpc.net/problem/11723

import  Foundation
let caseCount = Int(readLine()!)!
var commands = [(String,Int)]()

for _ in 0..<caseCount {
    let command = readLine()!.split(separator: " ").map{ String($0)}
    if command.count < 2 {
        commands.append((command[0],0))
    } else {
        commands.append((command[0],Int(command[1])!))
    }

}
var set = Array(repeating: false, count: 21)
var answer = [ String]()
for command in commands {
    switch command.0 {
    case "add":
        set[command.1] = true
    case "remove":
        set[command.1] = false
    case "check":
        if set[command.1] {
            answer.append("1")
        } else {
            answer.append("0")
        }
    case "toggle":
        if set[command.1] {
            set[command.1] = false
        } else {
            set[command.1] = true
        }
    case "all":
        set = Array(repeating: true, count: 21)
    default:
        set = Array(repeating: false, count: 21)
    }
}

for char in answer {
    print(char)
}
