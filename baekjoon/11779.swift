//
//  11779.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/04.
//
//  최소비용 구하기 2
//  https://www.acmicpc.net/problem/11779

let n = Int(readLine()!)!, m = Int(readLine()!)!
var graph = Array(repeating: [(to: Int, charge: Int)](), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let from = input[0]-1, to = input[1]-1, charge = input[2]
    graph[from].append((to, charge))
}

let input = readLine()!.split(separator: " ").map{Int(String($0))! - 1}
let from = input[0], to = input[1]
var minDist = Array(repeating: Int.max, count: n)

var q = [(from: from,charge: 0)]
var visit = Array(repeating: 0, count: n)
minDist[from] = 0

while !q.isEmpty {
    let first = q.removeFirst()
    let fromCity = first.from, currentCharge = first.charge
    
    if minDist[fromCity] < currentCharge { continue }
    
    for next in graph[fromCity] {
        if minDist[next.to] > currentCharge + next.charge {
            minDist[next.to] = currentCharge + next.charge
            q.append((next.to, minDist[next.to]))
            visit[next.to] = fromCity
        }
    }

    q.sort {
        return $0.charge < $1.charge
    }
   
}

func searchPath() -> [Int]{
    var stack = [Int]()
    var cur = to
    
    while cur != from {
        stack.append(cur)
        cur = visit[cur]
    }
    stack.append(from)
    
    return Array(stack.reversed()).map{Int($0)+1}
}
var path = searchPath()
print(minDist[to])
print(path.count)
print(path.map{String($0)}.joined(separator: " "))
