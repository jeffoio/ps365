//
//  0310_boj_1145.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/10.
//
//  적어도 대부분의 배수
//  https://www.acmicpc.net/problem/1145

var input = readLine()!.split(separator: " ").map { Double(String($0))! }
var multiple = 1.0

while true {
    let divide = input.filter {  Int(exactly: multiple/$0) != nil }
    if divide.count >= 3 { break }
    multiple = multiple + 1.0
    
}

print(Int(multiple))
