//
//  14496.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/08.
//
//  그대, 그머가 되어
//  https://www.acmicpc.net/problem/14496

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let a = input[0]-1, b = input[1]-1
input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]

var graph = Array(repeating: [(next: Int, distance: Int)](), count: n)

for _ in 0..<m {
    input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let ch1 = input[0]-1, ch2 = input[1]-1
    graph[ch1].append((ch2,1))
    graph[ch2].append((ch1,1))
}

var q = [(start: a, distance: 0)]
var minDist = Array(repeating: Int.max, count: n)
minDist[a] = 0

while !q.isEmpty {
    let cur = q.removeLast()
    
    for next in graph[cur.start] {
        if minDist[next.next] < cur.distance + next.distance {
            continue
        }
        
        if minDist[next.next] > cur.distance + next.distance {
            minDist[next.next] = cur.distance + next.distance
            q.append((next.next, minDist[next.next]))
        }
    }
    q.sort(by: { $0.distance > $1.distance })
}

if minDist[b] == Int.max {
    print(-1)
} else {
    print(minDist[b])
}
