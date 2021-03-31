//
//  0315_boj_11052.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/15.
//
//  카드 구매하기
//

var n = Int(readLine()!)!
var cardPrice = readLine()!.split(separator: " ").map{ Int(String($0))! }
var memo = Array(repeating: 0, count: n+1)

cardPrice.insert(0, at: 0)

for i in 1...n {
    for j in 1...i {
        memo[i] = max(memo[i], memo[i-j]+cardPrice[j])
    }
}

print(memo[n])
