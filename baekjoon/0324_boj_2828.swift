//
//  0324_boj_2828.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/24.
//
//  사과 담기 게임
//  https://www.acmicpc.net/problem/2828

let input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let screen = input[0]
let basket = input[1]
let appleCount = Int(readLine()!)!
var sum = 0
var basketPos = (1,basket)

for _ in 0..<appleCount {
    let i = Int(readLine()!)!
    if i >= basketPos.0 , i <= basketPos.1 { continue }
    else {
        if basketPos.0 > i {
            sum += (basketPos.0-i)
            basketPos = (i,basketPos.1 - (basketPos.0-i))
        } else {
            sum += (i-basketPos.1)
            basketPos = (basketPos.0+(i-basketPos.1),i)
        }
    }
}

print(sum)
