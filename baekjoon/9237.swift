//
//  9237.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/08.
//
//  이장님 초대
//  https://www.acmicpc.net/problem/9237

let n = Int(readLine()!)!
var trees = readLine()!.split(separator: " ").map({Int(String($0))!}).sorted(by: >)

for i in 0..<n {
    trees[i] += (i+1)
}

print(trees.max()!+1)
