//
//  0331_boj_15649.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/31.
//
//  N과 M (1)
//  https://www.acmicpc.net/problem/15649

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], count = input[1]
var visited = Array(repeating: false, count: n+1)
var sequence = Array(repeating: 0, count: count)

func backtracking(_ pickedCnt: Int) {
    if pickedCnt == count {
        for i in sequence {
            print(i, terminator: " ")
        }
        print("")
        return
    }
    
    for i in 1...n {
        if !visited[i] {
            sequence[pickedCnt] = i
            visited[i] = true
            backtracking(pickedCnt + 1)
            visited[i] = false
        }
    }
}

backtracking(0)
