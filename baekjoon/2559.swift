//
//  0309_boj_2559.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/09.
//
//  수열
//  https://www.acmicpc.net/problem/2559

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let K = input[1]
let temperature = readLine()!.split(separator: " ").map{ Int(String($0))! }
var idx = (start: 0, end: K-1)
var max = temperature[0..<K].reduce(0, +)
var beforeSum = max

while idx.end+1 < N {
    let nextSum = beforeSum - temperature[idx.start] + temperature[idx.end+1]
    if nextSum > max { max = nextSum }
    beforeSum = nextSum
    idx = (idx.start+1, idx.end+1)
}

print(max)
