//
//  0328_boj_1436.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/28.
//
//  영화감독 숌
//  https://www.acmicpc.net/problem/1436

let N = Int(readLine()!)!
var start = 0
var number = 666

while start != N {
    if is666(number: number) {
        start += 1
    }
    number += 1
}
print(number-1)
func is666(number: Int) -> Bool {
    var n = number
    var count6 = 0
    while n > 0 {
        if n % 10 == 6 {
            count6 += 1
        } else {
            count6 = 0
        }
        if count6 == 3 { break }
        n /= 10
    }
    return count6 == 3 ? true : false
}
