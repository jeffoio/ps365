//
//  11724.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/05.
//
//  연결 요소의 개수
//  https://www.acmicpc.net/problem/11724

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var dic = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)
var count = 0
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    dic[input[0]].append(input[1])
    dic[input[1]].append(input[0])
}

for i in 1..<dic.count {
    if visited[i] {
        continue
    }
    var que = [i]
    count += 1
    while !que.isEmpty {
        let vertex = que.removeLast()
        let connect = dic[vertex]
        visited[vertex] = true
        for i in connect {
            if visited[i] {
                continue
            }
            que.append(i)
        }
    }
}
print(count)
