//
//  10974.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/06.
//
//  모든 순열
//  https://www.acmicpc.net/problem/10974

let n = Int(readLine()!)!
var numbers = Array(1...n)
var visited = Array(repeating: false, count: numbers.count)
var storage = [[Int]]()
permutation(cur: 0, picked: [Int](), pick: n)

func permutation(cur: Int, picked: [Int] ,pick: Int) {
    if cur == pick {
        storage.append(picked)
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
for i in storage {
    print(i.map{String($0)}.joined(separator: " "))
}
