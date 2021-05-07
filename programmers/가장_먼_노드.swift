//
//  가장_먼_노드.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/07.
//
//  가장 먼 노드
//  https://programmers.co.kr/learn/courses/30/lessons/49189

import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    var visited = Array(repeating: false, count: n)
    visited[0] = true
    
    for e in edge {
        let u = e[0]-1, v = e[1]-1
        if graph[u] == nil {
            graph[u] = [v]
        } else {
            graph[u]!.append(v)
        }
        
        if graph[v] == nil {
            graph[v] = [u]
        } else {
            graph[v]!.append(u)
        }
    }
    
    var q = [(node: 0, distance: 0)]
    var maxCnt = (distance: 0, cnt: 0)
    
    while !q.isEmpty {
        let cur = q.removeFirst()
        if maxCnt.distance == cur.distance {
            maxCnt.cnt += 1
        } else {
            maxCnt = (cur.distance, 1)
        }
        for next in graph[cur.node]! {
            if visited[next] { continue }
            visited[next] = true
            q.append((next, cur.distance+1))
        }
    }
    
    return maxCnt.cnt
}
