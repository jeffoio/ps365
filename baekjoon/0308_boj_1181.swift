//
//  0308_boj_1181.swift
//  
//
//  Created by Jeff on 2021/03/08.
//
//  단어 정렬
//  https://www.acmicpc.net/problem/1181

var dic = [Int:[String]]()
let count = Int(readLine()!)!
var keys = [Int]()
for _ in 0..<count {
    let word = readLine()!
    if dic[word.count] == nil {
        dic[word.count] = [word]
        keys.append(word.count)
    } else {
        dic[word.count]?.append(word)
    }
}
keys.sort(by: <)

for key in keys {
    var words = Array(Set(dic[key]!))
    words.sort(by: <)
    
    for word in words {
        print(word)
    }
}
