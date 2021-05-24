//
//  17299.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/24.
//
//  오등큰수
//  https://www.acmicpc.net/problem/17299

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var numberCounter = Array(repeating: 0, count: 1000001)
var answer = Array(repeating: -1, count: n)
var stack = [Int]()

for num in numbers {
    numberCounter[num] += 1
}

for (idx,num) in numbers.enumerated() {
    if stack.isEmpty {
        stack.append(idx)
    } else {
        while !stack.isEmpty, numberCounter[numbers[stack.last!]] < numberCounter[num] {
            answer[stack.removeLast()] = num
        }
        stack.append(idx)
    }
}
print(answer.map{String($0)}.joined(separator: " "))
