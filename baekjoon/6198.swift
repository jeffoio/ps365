//
//  6198.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/24.
//
//  옥상 정원 꾸미기
//  https://www.acmicpc.net/problem/6198

let n = Int(readLine()!)!
var stack = [Int]()
var count = 0

for _ in 0..<n {
    let h = Int(readLine()!)!
    
    if stack.isEmpty {
        stack.append(h)
    } else {
        while !stack.isEmpty && stack.last! <= h {
            stack.removeLast()
        }
        stack.append(h)
    }
    count += (stack.count-1)
}

print(count)
