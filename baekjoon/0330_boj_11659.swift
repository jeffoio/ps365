//
//  0330_boj_11659.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/30.
//
//  구간 합 구하기 4
//  https://www.acmicpc.net/problem/11659

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var sequence = readLine()!.split(separator: " ").map{Int(String($0))!}
var prefixSum = [0]
var sum = 0
for i in 0..<sequence.count {
    sum += sequence[i]
    prefixSum.append(sum)
}

for _ in 0..<input[1] {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let i = input[0], j = input[1]
    print(prefixSum[j] - prefixSum[i-1])
}
