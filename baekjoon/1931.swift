//
//  1931.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/25.
//
//  회의실 배정
//  https://www.acmicpc.net/problem/1931

let n = Int(readLine()!)!
var meetings = [(start: Int, end:Int)]()
var maxCnt = 0
var cur = -1

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    meetings.append((input[0],input[1]))
}

meetings.sort {
    if $0.end == $1.end {
        return $0.start < $1.start
    }
    return $0.end < $1.end
}

for meet in meetings {
    if meet.start >= cur {
        cur = meet.end
        maxCnt += 1
    }
}
print(maxCnt)
