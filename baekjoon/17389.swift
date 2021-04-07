//
//  17389.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/07.
//
//  보너스 점수
//  https://www.acmicpc.net/problem/17389

let n = Int(readLine()!)!
var arr = Array(readLine()!).map{ String($0)}
var bonus = 0
var score = 0
for i in arr.enumerated() {
    if i.element == "O" {
        score += (i.offset+1)
        score += bonus
        bonus += 1
    } else {
        bonus = 0
    }
}
print(score)
