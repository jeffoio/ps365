//
//  3273.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/21.
//
//  두 수의 합
//  https://www.acmicpc.net/problem/3273

let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let x = Int(readLine()!)!
var dic = [Int: Int]()

for num in input{
    dic[num] = 1
}
var cnt = 0
for key in dic.keys {
    let y = x - key
    if dic[y] != nil { cnt += 1}
}

print(cnt/2)
