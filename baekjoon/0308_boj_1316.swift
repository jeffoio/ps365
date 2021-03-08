//
//  0308_boj_2316.swift
//
//
//  Created by Jeff on 2021/03/08.
//
//  1316번 그룹 단어 체커
//  https://www.acmicpc.net/problem/1316

let N = Int(readLine()!)!
var groupWord = 0

for _ in 0..<N {
    let word = readLine()!.lowercased()
    var container = [Character]()
    var beforeChar: Character = " "
    var check = true
    for char in word {
        if container.contains(char) {
            if beforeChar == char { continue}
            check = false
            break
        } else {
            container.append(char)
            beforeChar = char
        }
    }
    if check { groupWord += 1}
}

print(groupWord)
