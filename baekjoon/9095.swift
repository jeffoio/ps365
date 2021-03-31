//
//  0314_boj_9095.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/14.
//
//  1, 2, 3 더하기
//  
var D = [0,1,2,4,7]
let caseCount = Int(readLine()!)!

for i in 5...10 {
    let count = D[i-1] + D[i-2] + D[i-3]
    D.append(count)
}

for _ in 0..<caseCount {
    let idx = Int(readLine()!)!
    print(D[idx])
}
