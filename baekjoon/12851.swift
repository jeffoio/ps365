//
//  12851.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/07.
//
//  숨바꼭질2
//  https://www.acmicpc.net/problem/12851

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]

var q = [n]
var dist = Array(repeating: (dist:0, count:0), count: 100001)
var next = [{(x: Int) -> Int in x + 1 }, {(x: Int) -> Int in x - 1 }, {(x: Int) -> Int in x*2 }]

if n == k {
    print("\(0)\n\(1)")
} else {
    loop: while !q.isEmpty {
        var nextQ = [Int]()
        
        for cur in q {
            for f in next {
                let nx = f(cur)
                if nx < 0 || nx > 100000 { continue }
                if dist[nx].dist != 0, dist[nx].dist < dist[cur].dist + 1 { continue }
                if dist[nx].dist == 0 {
                    dist[nx].dist = dist[cur].dist + 1
                    dist[nx].count = 1
                } else {
                    dist[nx].count += 1
                }
            
                nextQ.append(nx)
            }
        }
        q = nextQ
    }

    print("\(dist[k].dist)\n\(dist[k].count)")

}
