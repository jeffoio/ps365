//
//  1920.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/10.
//
//  수 찾기
//  https://www.acmicpc.net/problem/1920

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var indexing = [Int:Int]()

for number in numbers {
    indexing[number] = 1
}
var answer = ""
let wantCount = Int(readLine()!)!
let wants = readLine()!.split(separator: " ").map{Int(String($0))!}

for want in wants {
    if indexing[want] == nil {
        answer += "0\n"
    }else {
        answer += "1\n"
    }
}
print(answer)
