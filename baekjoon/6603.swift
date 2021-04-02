//
//  6603.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  로또
//  https://www.acmicpc.net/problem/6603

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var numbers = Array(input[1...])
    if input[0] == 0 {
        break
    }
    dfs(idx: 0, numbers: numbers, picked: [Int]())
    print("")
}

func dfs(idx: Int, numbers: [Int], picked: [Int]) {
    if idx >= numbers.count {
        if picked.count == 6 {
            for i in picked {
                print(i, terminator: " ")
            }
            print("")
        }
        return
    }
    
    dfs(idx: idx+1, numbers: numbers, picked: picked + [numbers[idx]])
    dfs(idx: idx+1, numbers: numbers, picked: picked)
}
