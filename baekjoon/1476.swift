//
//  0309_boj_1476.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/09.
//
//  날짜 계산
//  https://www.acmicpc.net/problem/1476
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let E = input[0] == 15 ? 0 : input[0]
let S = input[1] == 28 ? 0 : input[1]
let M = input[2] == 19 ? 0 : input[2]

var year = 1
while true {
    if year % 15 == E && year % 28 == S && year % 19 == M {
        print(year)
        break
    }
    year += 1
}
