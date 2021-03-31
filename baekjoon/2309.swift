//
//  0322_boj_2309.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/22.
//
//  일곱 난쟁이
//  https://www.acmicpc.net/problem/2309

var short = [Int]()
var storage = [[Int]]()


for i in 0..<9 {
    short.append(Int(readLine()!)!)
}

combination(of: short, selectedCount: 7, current: 0, seletcted: [], storage: &storage)

for i in storage {
    if i.reduce(0, +) == 100 {
        short = i
    }
}

short.sort()
for i in short {
    print(i)
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
