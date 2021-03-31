//
//  0327_boj_11866.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/27.
//
//  요세푸스 문제 0
//  https://www.acmicpc.net/problem/11866\

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var circle = Array(1...n)
var answer = [Int]()
var idx = 0

while answer.count != n {
    idx = idx + (k-1)
    if idx >= circle.count {
        idx = idx % circle.count
    }
    answer.append(circle.remove(at: idx))
}

var str = "<\(answer.map{String($0)}.joined(separator: ", "))>"

print(str)
