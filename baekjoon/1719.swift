//
//  1719.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/05.
//
//  택배
//  https://www.acmicpc.net/problem/1719

let line = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = line[0], m = line[1]
var graph = Array(repeating: [(node: Int, weight: Int)](), count: n)
var board = [String]()

for _ in 0..<m {
    let edgeInfo = readLine()!.split(separator: " ").map{Int(String($0))!}
    let u = edgeInfo[0] - 1
    let v = edgeInfo[1] - 1
    let w = edgeInfo[2]
    graph[u].append((v,w))
    graph[v].append((u,w))
}

for start in 0..<n {
    var minDist = Array(repeating: Int.max, count: n)
    var q = [(node: start, weight: 0)]
    var parent = Array(repeating: -1, count: n)
    minDist[start] = 0

    while !q.isEmpty {
        let now = q.removeLast()

        if minDist[now.node] < now.weight {
            continue
        }

        for next in graph[now.node] {
            let nextNode = next.node
            let nextDistance = next.weight + now.weight

            if minDist[nextNode] > nextDistance {
                minDist[nextNode] = nextDistance
                q.append((node: nextNode, weight: minDist[nextNode]))
                parent[nextNode] = now.node
            }
        }

        q.sort { $0.weight > $1.weight }
    }

    var answer = [String]()
    for node in 0..<n {
        if node == start {
            answer.append("-")
        } else {
            answer.append(getPrimal(i: node, start: start, parent: parent))
        }
        
    }
    
    print(answer.joined(separator: " "))


}


func getPrimal(i: Int, start: Int, parent: [Int]) -> String {
    if parent[i] == start {
        return String(i+1)
    }
    var p = parent[i]
    while p != start {
        if parent[p] == start {
            return String(p+1)
        }
        p = parent[p]
    }
    return String(0)
}
