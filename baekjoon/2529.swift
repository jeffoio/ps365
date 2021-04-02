//
//  2529.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  부등호
//  https://www.acmicpc.net/problem/2529

let n = Int(readLine()!)!
var sign = readLine()!.split(separator:" ").map{ String($0)}
let numbers = Array(0...9).map{Int(String($0))!}
var visited = Array(repeating: false, count: 10)
var seq = [String]()

dfs(pickCount: 0, arr: [Int]())
print(seq.last!)
print(seq.first!)

func dfs(pickCount: Int, arr: [Int]) {
    if pickCount == n+1 {
        seq.append(arr.map{String($0)}.joined())
        return
    }

    for i in 0...9 {
        if !visited[i] {
            visited[i] = true
            if !arr.isEmpty {
                if !checkExpression(left: arr.last!, sign: sign[arr.count-1], right: numbers[i]){
                    visited[i] = false
                    continue
                }
            }
            dfs(pickCount: pickCount+1, arr: arr + [numbers[i]])
            visited[i] = false
        }
        
    }
}

func checkExpression(left: Int, sign: String, right: Int) -> Bool {
    switch sign {
    case "<":
        return left < right
    default:
        return left > right
    }
}
