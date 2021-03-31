//
//  0316_boj_16194.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/16.
//
//  카드 구매하기 2
//  
var n = Int(readLine()!)!
var cardPrice = readLine()!.split(separator: " ").map{ Int(String($0))! }
var memo = Array(repeating: 0, count: n+1)

cardPrice.insert(0, at: 0)

for i in 1...n {
    for j in 1...i {
        if memo[i] == 0 {
            memo[i] = memo[i-j]+cardPrice[j]
        } else {
            memo[i] = min(memo[i], memo[i-j]+cardPrice[j])
        }
    
    }
}

print(memo[n])
