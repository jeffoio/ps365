//
//  10539.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/07.
//
//  수빈이와 수열
//  https://www.acmicpc.net/problem/10539

let n = Int(readLine()!)!
var sequence = readLine()!.split(separator: " ").map{Int(String($0))!}
var ans = Array(repeating: sequence[0], count: n)
for i in 1..<n {
    sequence[i] = sequence[i] * (i+1)
    ans[i] = sequence[i] - sequence[i-1]
}
print(ans.map{String($0)}.joined(separator: " "))
