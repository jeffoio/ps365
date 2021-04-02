//
//  9934.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  완전 이진 트리
//  https://www.acmicpc.net/problem/9934

let level = Int(readLine()!)!
var order = readLine()!.split(separator: " ").map{String($0)}
var building = Array(repeating: "", count: level)

func bfs(start: Int, order: [String]) {
    if start == level {
        return
    }
    if order.count == 3 {
        building[start] = building[start] + "\(order[1]) "
        building[start+1] =  building[start+1]  + "\(order[0]) \(order[2]) " //building[start+1] +
        return
    }

    let midIdx = order.count / 2
    let left = Array(order[..<midIdx])
    let right = Array(order[(midIdx+1)...])
    building[start] = building[start] + "\(order[midIdx]) "

    bfs(start: start+1, order: left)
    bfs(start: start+1, order: right)


}
bfs(start: 0, order: order)

for i in building {
    print(i)
}
