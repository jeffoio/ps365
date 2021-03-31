//
//  0318_boj_1120.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  문자열
//  
let input = readLine()!.split(separator: " ").map{ String($0)}
var a = Array(input[0]).map{ String($0)}
let b = Array(input[1]).map{ String($0)}
var diffenceCount = b.count

for addCount in 0...b.count-a.count {
    let add = Array(repeating: ".", count: addCount)
    let changeA = add + a
    var count = 0
    for idx in 0..<changeA.count {
        if changeA[idx] != b[idx] {
            count += 1
        }
    }
    count = count - add.count
    
    if count < diffenceCount {
        diffenceCount = count
    }
}

print(diffenceCount)
