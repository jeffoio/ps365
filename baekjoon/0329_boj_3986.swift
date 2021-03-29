//
//  0329_boj_3986.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  좋은 단어
//  https://www.acmicpc.net/problem/3986

let n = Int(readLine()!)!
var count = 0

for _ in 0..<n {
    let word = readLine()!
    if checkGoodWord(word: word) {
        count += 1
    }
}

print(count)


func checkGoodWord(word: String) -> Bool {
    var stack = [Character]()
    
    for char in word {
        if stack.isEmpty {
            stack.append(char)
        } else {
            if stack.last == char {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
    }
    
    return stack.isEmpty
    
}

