//
//  0329_boj_1213.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  팰린드롬 만들기
//  https://www.acmicpc.net/problem/1213

var input = Array(readLine()!).map{String($0)}
var dic = [String:Int]()

for i in input {
    if dic[i] == nil {
        dic[i] = 1
    } else {
        dic[i] = dic[i]! + 1
    }
}

var answer = ""
var alphabet = Array("ABCDEFGHIJKLMNOPQRSTUVWXYZ").map{String($0)}
var mid = ""
var check = true
for char in alphabet {
    if dic[char] == nil { continue }
    var numberOfChar = dic[char]!
    
    if numberOfChar % 2 != 0 {
        if mid == "" {
            mid = char
        } else {
            check = false
            break
        }
        
    }
    
    numberOfChar /= 2
    for _ in 0..<numberOfChar {
        answer.append(char)
    }
    
}

if mid != "" {
    answer = answer + mid + String(answer.reversed())
} else {
    answer = answer + String(answer.reversed())
}

if answer == String(answer.reversed()), check {
    print(answer)
} else {
    print("I'm Sorry Hansoo")
}
