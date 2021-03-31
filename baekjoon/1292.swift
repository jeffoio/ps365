//
//  0310_boj_1292.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/10.
//
//  쉽게 푸는 문제
//  https://www.acmicpc.net/problem/1292

func getNumber(num: Int) -> (Int,Int) {
    var startPos = 2
    var value = 2
    if num == 1 { return (1,1) }
    while true {
        if startPos <= num && num < startPos+value {
            return (startPos,value)
        }
        startPos = startPos + value
        value += 1
    }
    
}

let input = readLine()!.split(separator: " ").map{Int(String($0))! }
let start = getNumber(num: input[0])
var pos = input[0]
var value = start.1
var bound = start.0+value
var sum = 0

while pos <= input[1] {
    if pos == bound {
        value+=1
        bound = pos+value
    }
    sum += value
    pos += 1
}

print(sum)
