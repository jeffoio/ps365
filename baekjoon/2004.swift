//
//  2004.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/04.
//
//  조합 0의 개수
//  https://www.acmicpc.net/problem/2004

let input = readLine()!.split(separator: " ").map({ Int(String($0))!})
let n = input[0], m = input[1]
let five = getNumber(num: n, divide: 5) - getNumber(num: m, divide: 5) - getNumber(num: n-m, divide: 5)
let two = getNumber(num: n, divide: 2) - getNumber(num: m, divide: 2) - getNumber(num: n-m, divide: 2)
print(min(five, two))

func getNumber(num: Int ,divide: Int) -> Int {
    var sum = 0
    var d = divide
    while d <= num {
        sum += num/d
        d *= divide
    }
    
    return sum
}