//
//  0320_boj_2606.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/20.
//  바이러스
//  https://www.acmicpc.net/problem/2606

let computerCount = Int(readLine()!)!
let connectCount = Int(readLine()!)!
var network = Array(repeating: [Int](), count: computerCount+1)

for _ in 0..<connectCount {
    let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
    network[input[0]].append(input[1])
    network[input[1]].append(input[0])
}
var visit = [1]
var count = 0
for pos in network[1] {
    if visit.contains(pos) { continue }
    var q = [pos]
    while !q.isEmpty {
        let cur = q.removeLast()
        if visit.contains(cur) { continue }
        visit.append(cur)
        count += 1
        if !network[cur].isEmpty {
            q += network[cur]
        }
    }
}

print(count)
