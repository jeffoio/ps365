//
//  1238.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/06.
//
//  파티
//  https://www.acmicpc.net/problem/1238

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0], m = line[1], x = line[2]-1
var graph = Array(repeating: [(node: Int, weight: Int)](), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let start = input[0] - 1
    let end = input[1] - 1
    let weight = input[2]
    graph[start].append((end,weight))
}

var weightArray = [[Int]]()

for start in 0..<n {
    var minDist = Array(repeating: Int.max, count: n)
    minDist[start] = 0
    var q = [(node: start, weight: 0)]
    
    while !q.isEmpty {
        let now = q.removeLast()
        
        if minDist[now.node] < now.weight { continue }
        
        for next in graph[now.node] {
            if minDist[next.node] > now.weight + next.weight {
                minDist[next.node] = now.weight + next.weight
                q.append((next.node, minDist[next.node]))
            }
        }
        
        q.sort(by: {$0.weight > $1.weight })
    }
    weightArray.append(minDist)
}

var maxDistance = 0

for start in 0..<n {
    if start == x { continue }
    let totalCost = weightArray[start][x] + weightArray[x][start]
    maxDistance = max(maxDistance, totalCost)
}

print(maxDistance)
