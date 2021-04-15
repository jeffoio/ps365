//
//  11651.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/15.
//
//  좌표 정렬하기 2
//  https://www.acmicpc.net/problem/11651

import Foundation

let n = Int(readLine()!)!
var arr = [(x:Int, y:Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
    arr.append((input[0],input[1]))
}

arr.sort {
    if $0.y == $1.y {
        return $0.x < $1.x
    }
    return $0.y < $1.y
}
for pos in arr {
    print("\(pos.0) \(pos.1)")
}
