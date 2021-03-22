//
//  0322_boj_2688.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/22.
//
//  줄어들지 않아
//  https://www.acmicpc.net/problem/2688

var memo = [[Int]]()
memo.append([10])
memo.append([10,9,8,7,6,5,4,3,2,1])
for i in 2...65 {
    let beforeSum = memo[i-1].reduce(0, +)
    var temp = [beforeSum]
    for j in 0..<9 {
        temp.append(beforeSum - memo[i-1][0...j].reduce(0, +))
    }
    memo.append(temp)
}

let caseCount = Int(readLine()!)!
for _ in 0..<caseCount {
    let input = Int(readLine()!)!
    print(memo[input-1].reduce(0, +))
}


func DP(num: Int) -> Int {
    if memo.count >= num { return memo[num-1].reduce(0, +) }
    let beforeSum = DP(num: num-1)
    var temp = [beforeSum]
    for i in 0..<9 {
        temp.append(beforeSum - memo[num-2][0...i].reduce(0, +))
    }
    memo.append(temp)
    return temp.reduce(0, +)
}

