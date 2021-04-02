//
//  15651.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  N과 M (3)
//  https://www.acmicpc.net/problem/15651

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
let numbers = Array(1...n).map{String($0)}
var sequence = [[String]]()

dfs(pickCount: 0, arr: [String]())

func dfs(pickCount: Int, arr: [String]) {
    if pickCount == m {
        print(arr.joined(separator: " "))
        return
    }
    
    for i in 0..<n {
        dfs(pickCount: pickCount+1, arr: arr + [numbers[i]])
    }
}
