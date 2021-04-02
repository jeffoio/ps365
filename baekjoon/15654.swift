//
//  15654.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  N과 M (5)
//  https://www.acmicpc.net/problem/15654

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}.sorted()
var visited = Array(repeating: false, count: numbers.count)
permutation(cur: 0, picked: [Int](), pick: m)

func permutation(cur: Int, picked: [Int] ,pick: Int) {
    if cur == pick {
        print(picked.map{String($0)}.joined(separator: " "))
        return
    }

    for i in 0..<numbers.count {
        if !visited[i] {
            visited[i] = true
            permutation(cur: cur+1, picked: picked + [numbers[i]], pick: pick)
            visited[i] = false
        }

    }
}
