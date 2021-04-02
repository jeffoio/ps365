//
//  15655.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  N과 M (6) 
//  https://www.acmicpc.net/problem/15655

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()


func backtracking(idx: Int, arr: [Int]) {
    if idx == m {
        print(arr.map{String($0)}.joined(separator: " "))
        return
    }
    
    for i in idx..<n {
        if !arr.isEmpty, arr[idx-1] >= numbers[i] { continue }
        backtracking(idx: idx+1, arr: arr + [numbers[i]])
    }
}

backtracking(idx: 0, arr: [Int]())
