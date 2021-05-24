//
//  17298.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/24.
//
//  오큰수
//  https://www.acmicpc.net/problem/17298

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var stack = [Int]()
var answer = Array(repeating: -1, count: n)

for (idx, number) in numbers.enumerated(){
    if stack.isEmpty {
        stack.append(idx)
    } else {
        while !stack.isEmpty, numbers[stack.last!] < number {
            answer[stack.removeLast()] = number
        }
        stack.append(idx)
    }
}

print(answer.map{String($0)}.joined(separator: " "))
