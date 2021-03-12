//
//  0313_boj_11727.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/13.
//
//  2×n 타일링 2
//  https://www.acmicpc.net/problem/11727

// 다이나믹 - 문제를 나눌때 단계 1개 + 나머지 전체로 나누기
let n = Int(readLine()!)!
var d = Array(repeating: 0, count: 1001)

func tile(num: Int) -> Int {
    if num == 1 { return 1 }
    if num == 0 { return 1 }

    if d[num] != 0 { return d[num] }
    d[num] = (tile(num: num-1) % 10007) + (tile(num: num-2) % 10007) * 2

    return d[num] % 10007
}

print(tile(num: n))
