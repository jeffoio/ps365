//
//  0325_boj_1003.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/25.
//
//  피보나치 함수
//  https://www.acmicpc.net/problem/1003

let caseCount = Int(readLine()!)!
var memo = Array(repeating: (0,0), count: 41)
memo[0] = (1,0)
memo[1] = (0,1)
fibo(num: 40)
for _ in 0..<caseCount {
    let num = Int(readLine()!)!
    print("\(memo[num].0) \(memo[num].1)")
}

func fibo(num: Int) -> (Int,Int) {
    if memo[num] != (0,0) { return memo[num]}
    memo[num] = (fibo(num: num-1).0 + fibo(num: num-2).0, fibo(num: num-1).1 + fibo(num: num-2).1)
    return memo[num]
}
