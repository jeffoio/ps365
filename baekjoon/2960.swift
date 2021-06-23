//
//  2960.swift
//  codingtest
//
//  Created by jeff on 2021/06/23.
//
//  에라토스테네스의 체
//  https://www.acmicpc.net/problem/2960

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var (n,k) = (input[0], input[1])
var primeArr = Array(repeating: false, count: n+1)

for i in 2...n {
    if primeArr[i] { continue }
    
    for p in stride(from: i, through: n, by: i) {
        if primeArr[p] { continue }
        primeArr[p] = true
        k-=1
        if k == 0 { print(p) }
    }
}
