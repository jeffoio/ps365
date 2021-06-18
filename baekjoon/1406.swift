//
//  1406.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/18.
//
//  에디터
//  https://www.acmicpc.net/problem/1406

var left = readLine()!
var right = ""
var testCase = Int(readLine()!)!

for _ in 0..<testCase {
    let command = readLine()!
    switch command {
    case "L":
        if !left.isEmpty {
            right.append(left.removeLast())
        }
    case "D":
        if !right.isEmpty {
            left.append(right.removeLast())
        }
    case "B":
        if !left.isEmpty {
            left.removeLast()
        }
    default:
        left.append(command.last!)
    }
}

print(left + right.reversed())
