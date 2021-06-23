//
//  1138.swift
//  codingtest
//
//  Created by jeff on 2021/06/23.
//
//  한 줄로 서기
//  https://www.acmicpc.net/problem/1138

let n = Int(readLine()!)!
let posArr = readLine()!.split(separator: " ").map{ Int(String($0))! }
var answer = Array(repeating: -1, count: n)

for (tall,distance) in posArr.enumerated() {
    var distance = distance
    var idx = 0
    
    while distance != 0 {
        if answer[idx] == -1 || answer[idx] > tall {
            distance -= 1
        }
        idx += 1
    }
    
    while answer[idx] != -1 {
        idx += 1
    }
    
    answer[idx] = tall
}

print(answer.map{$0+1}.map{String($0)}.joined(separator: " "))
// 2 1 1 0
// -1 -1 -1 -1
