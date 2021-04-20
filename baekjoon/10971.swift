//
//  10971.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/20.
//
//  외판원 순회 2
//  https://www.acmicpc.net/problem/10971

let n = Int(readLine()!)!
var price = [[Int]]()
var minValue = Int.max
var visited = Array(repeating: false, count: n)

for _ in 0..<n {
    price.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

func backTracking(from: Int, visitedCount: Int, curCost: Int ,visited: [Bool], curCity: Int) {
    
    if minValue < curCost {
        return
    }
    if visitedCount == n-1 {
        if price[curCity][from] == 0 { return }
        if minValue > curCost + price[curCity][from] {
            minValue = curCost + price[curCity][from]
        }
        return
    }
    var visited = visited
    
    for idx in 0..<visited.count {
        if visited[idx] || price[curCity][idx] == 0 { continue }
        visited[idx] = true
        //print("from:\(from) visitCnt: \(visitedCount) cur:\(curCity) next: \(idx) cost: \(curCost) \(visited)")
        backTracking(from: from, visitedCount: visitedCount+1, curCost: curCost+price[curCity][idx], visited: visited, curCity: idx)
        
        visited[idx] = false
    }
}

for i in 0..<n {
    visited[i] = true
    backTracking(from: i, visitedCount: 0, curCost: 0, visited: visited, curCity: i)
    visited[i] = false
}

print(minValue)
