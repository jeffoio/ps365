//
//  0326_boj_8979.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/26.
//
//  올림픽
//  https://www.acmicpc.net/problem/8979

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var gold = [Int](), silver = [Int](), bronze = [Int]()
var kIdx = 0
for i in 0..<n {
    let medal = readLine()!.split(separator: " ").map{Int(String($0))!}
    if medal[0] == k { kIdx = i }
    gold.append(medal[1])
    silver.append(medal[2])
    bronze.append(medal[3])
}
var rank = 1

for country in 0..<n {
    if gold[country] > gold[kIdx] {
        rank += 1
    }
    if gold[country] == gold[kIdx] {
        if silver[country] > silver[kIdx] {
            rank += 1
        }
        
        if silver[country] == silver[kIdx] {
            if bronze[country] > bronze[kIdx]{
                rank += 1
            }
        }
    }
}

print(rank)
