//
//  0325_boj_15650.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/25.
//
//  N과 M (2)
//  https://www.acmicpc.net/problem/15650

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var array = Array(1...n)
var stor = [[Int]]()

combination(of: array, selectedCount: m, current: 0, seletcted: [], storage: &stor)

for i in stor {
    for j in i {
        print(j, terminator: " ")
    }
    print("")
}
func combination(of total: [Int], selectedCount: Int,current idx: Int, seletcted: [Int], storage: inout [[Int]]) {
    if selectedCount == 0 { storage.append(seletcted) }
    else if idx == total.count { return }
    else {
        let new = seletcted + [total[idx]]
        combination(of: total, selectedCount: selectedCount-1, current: idx+1, seletcted: new, storage: &storage)
        combination(of: total, selectedCount: selectedCount, current: idx+1, seletcted: seletcted, storage: &storage)
    }
}
