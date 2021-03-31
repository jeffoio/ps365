//
//  0312_boj_1463.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/12.
//
//  1로 만들기
//  https://www.acmicpc.net/problem/1463

var n = Int(readLine()!)!
var k = Array(repeating: 0, count: n+1)

for i in 0...n {
    if i < 2 { continue }
    k[i] = k[i-1] + 1
    if i%2 == 0, k[i] > k[i/2] + 1 {
        k[i] = k[i/2] + 1
    }
    if i%3 == 0, k[i] > k[i/3] + 1 {
        k[i] = k[i/3] + 1
    }
}
print(k[n])
