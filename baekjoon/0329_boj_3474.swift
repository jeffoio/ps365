//
//  0329_boj_3474.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  교수가 된 현우
//  https://www.acmicpc.net/problem/3474

var testCase = Int(readLine()!)!
var zeroCount = 0

for _ in 0..<testCase {
    let input = Int(readLine()!)!
    var five = 0
    var i = 5
    while i<=input {
        five += (input/i)
        i *= 5
    }
    print(five)
}
