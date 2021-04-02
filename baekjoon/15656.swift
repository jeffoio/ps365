//
//  15656.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  N과 M (7
//  https://www.acmicpc.net/problem/15656

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var nv = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var numbers = nv.map{String($0)}

func backtracking(idx: Int, arr: String) {
    if idx == m {
        print(arr)
        return
    }
    
    for i in 0..<n {
        backtracking(idx: idx+1, arr: arr + "\(numbers[i]) ")
    }
}

backtracking(idx: 0, arr: "")
