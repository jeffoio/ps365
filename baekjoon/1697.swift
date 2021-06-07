//
//  1697.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/07.
//
//  숨바꼭질
//  https://www.acmicpc.net/problem/1697

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], k = input[1]
var q = [n]
if n == k {
    print(0)
} else {
    var dist = Array(repeating: 0, count: 100001)
    
    loop: while !q.isEmpty {
        var nextQ = [Int]()
        for cur in q {
            for step in [-1,1,2] {
                let nx = next(n: cur, step: step)
                if nx < 0 || nx > 100000 { continue }
                if dist[nx] > 0 { continue }
                nextQ.append(nx)
                dist[nx] = dist[cur] + 1
                if nx == k {
                    break loop
                }
            }
        }
        q = nextQ
    }
    
    print(dist[k])
}

func next(n: Int, step:Int) -> Int {
    if step == -1 {
        return n - 1
    }
    if step == 1 {
        return n + 1
    }
    if step == 2 {
        return n*2
    }
    return 0
}
