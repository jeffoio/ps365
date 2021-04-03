//
//  2003.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/03.
//
//  수들의 합 2
//  https://www.acmicpc.net/problem/2003

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0

for i in 0..<numbers.count {
    var sum = 0
    var idx = i
    while idx < numbers.count {
        sum += numbers[idx]
        if sum == m {
            count += 1
            break
        }
        if sum > m {
            break
        }
        idx += 1
    }
}
print(count)
