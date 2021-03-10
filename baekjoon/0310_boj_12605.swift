//
//  0310_boj_12605.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/10.
//
//  단어순서 뒤집기
//  https://www.acmicpc.net/problem/12605

let testCount = Int(readLine()!)!

for caseNum in 0..<testCount {
    var input = readLine()!.split(separator: " ")
    input.reverse()
    
    print("Case #\(caseNum+1): \(input.joined(separator: " "))")
}
