//
//  1629.swift
//  codingtest
//
//  Created by jeff on 2021/06/24.
//
//  곱셈
//  https://www.acmicpc.net/problem/1629

let input = readLine()!.split(separator: " ").map{Int(String($0))!}

func f(a:Int, b:Int, m:Int) -> Int {
    if b == 1 {
        return a%m
    }
    
    var ans = f(a: a, b: b/2, m: m)
    ans = ans * ans % m
    if b%2 == 0 {
        return ans
    }
    
    return ans*a%m
    
}

print(f(a: input[0], b: input[1], m: input[2]))
