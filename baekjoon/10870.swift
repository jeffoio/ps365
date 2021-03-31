//
//  0314_boj_10870.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/14.
//  피보나치 수 5
//  https://www.acmicpc.net/problem/10870

var n = Int(readLine()!)!
var memo = Array(repeating: 0, count: n+1)

func fibo(num: Int) -> Int {
    if num == 0 { return 0}
    if num < 3 { return 1 }
    if memo[num] != 0 { return memo[num] }
    memo[num] = fibo(num: num-1) + fibo(num: num-2)
    
    return memo[num]
}
print(fibo(num: n))
