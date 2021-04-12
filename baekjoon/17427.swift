//
//  17427.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/12.
//
//  약수의 합 2
//  https://www.acmicpc.net/problem/17427

var n = Int(readLine()!)!
var sum = 0

for i in 1...n {
    sum += (n/i)*i
}
print(sum)
