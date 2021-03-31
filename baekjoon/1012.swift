//
//  0320_boj_1012.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/20.
//
//  유기농 배추
//  https://www.acmicpc.net/problem/1012

let caseCount = Int(readLine()!)!

for _ in 0..<caseCount {
    let info = readLine()!.split(separator: " ").map{ Int(String($0))!}
    var board = Array(repeating: Array(repeating: 0, count: info[0]), count: info[1])
    var visited = Array(repeating: Array(repeating: false, count: info[0]), count: info[1])
    var cabs = [(Int,Int)]()
    var count = 0
    var que = [(Int,Int)]()
    for _ in 0..<info[2] {
        let position = readLine()!.split(separator: " ").map{ Int(String($0))!}
        board[position[1]][position[0]] = 1
        cabs.append((position[0],position[1]))
    }
    
    for pos in cabs {
        if visited[pos.1][pos.0] { continue }
        count += 1
        visited[pos.1][pos.0] = true
        que.append(pos)
        while !que.isEmpty {
            let current = que.removeLast()
            let dx = [-1,0,1,0]
            let dy = [0,1,0,-1]
            visited[current.1][current.0] = true
            for i in 0..<4 {
                let nx = dx[i]+current.0
                let ny = dy[i]+current.1
                if nx >= info[0] || nx < 0 || ny >= info[1] || ny < 0 || visited[ny][nx] {
                    continue
                }
                if board[ny][nx] != 0 { que.append((nx,ny))}
                visited[ny][nx] = true

            }
        }
    }
    
    print(count)
    
}
