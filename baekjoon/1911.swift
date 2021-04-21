//
//  1911.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/21.
//
//  흙길 보수하기
//  https://www.acmicpc.net/problem/1911

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], l = input[1]
var positions = [(start:Int, end: Int)]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    positions.append((input[0],input[1]))
}

positions.sort {
    return $0.start < $1.start
}

var cnt = 0, lastPos = 0
for pos in positions {
    var distance = 0
    if lastPos > pos.end { continue }
    if lastPos >= pos.start {
        distance = pos.end - lastPos
    } else {
        distance = pos.end - pos.start
    }
    if distance % l == 0 {
        lastPos = pos.end
    } else {
        cnt += 1
        lastPos = pos.end + l - (distance%l)
    }
    
    cnt += (distance/l)
    
}
print(cnt)
