//
//  2798.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/07.
//
//  블랙잭
//  https://www.acmicpc.net/problem/2798

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let nums = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var stor = [[Int]]()
var max = 0
func combination(of total: [Int], selectedCount: Int,current idx: Int, seletcted: [Int], storage: inout [[Int]]) {
    if selectedCount == 0 {
        let sum = seletcted.reduce(0,+)
        if max < sum , sum <= m { max = sum }
    }
    else if idx == total.count { return }
    else {
        let new = seletcted + [total[idx]]
        //if new.reduce(0,+) > m { return }
        combination(of: total, selectedCount: selectedCount-1, current: idx+1, seletcted: new, storage: &storage)
        combination(of: total, selectedCount: selectedCount, current: idx+1, seletcted: seletcted, storage: &storage)
    }
}

combination(of: nums, selectedCount: 3, current: 0, seletcted: [], storage: &stor)
print(max)
