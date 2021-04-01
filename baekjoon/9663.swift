//
//  9663.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/01.
//
//  N-Queen
//  https://www.acmicpc.net/problem/9663

let n = Int(readLine()!)!
var colUsed = Array(repeating: false, count: 40)
var leftDiagonalUsed = Array(repeating: false, count: 40)
var rightDiagonalUsed = Array(repeating: false, count: 40)


var count = 0

func backtracking(_ putRow: Int) {
    if putRow == n {
        count += 1
        return
    }
    
    for col in 0..<n {
        if colUsed[col] || leftDiagonalUsed[putRow-col+n-1] || rightDiagonalUsed[putRow+col] {
            continue
        }
        colUsed[col] = true
        leftDiagonalUsed[putRow-col+n-1] = true
        rightDiagonalUsed[putRow+col] = true
        
        backtracking(putRow+1)
        
        colUsed[col] = false
        leftDiagonalUsed[putRow-col+n-1] = false
        rightDiagonalUsed[putRow+col] = false
        
    }
    
}


backtracking(0)
print(count)
