//
//  1926.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/03.
//
//  그림
//  https://www.acmicpc.net/problem/1926

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var board = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [0,1,0,-1], dy = [1,0,-1,0]
var maxCnt = 0, numberOfPic = 0

for _ in 0..<n {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
}

for x in 0..<n {
    for y in 0..<m {
        if board[x][y] == 0 || visited[x][y] { continue }
        visited[x][y] = true
        numberOfPic += 1
        var q = [(x: x, y: y)]
        var count = 1
        
        while !q.isEmpty {
            let cur = q.removeFirst()
            
            for i in 0..<4 {
                let nx = cur.x + dx[i], ny = cur.y + dy[i]
                if nx < 0 || ny < 0 || nx >= n || ny >= m {
                    continue
                }
                if visited[nx][ny] || board[nx][ny] == 0 { continue }
                visited[nx][ny] = true
                q.append((nx, ny))
                count += 1
            }
        }
        
        maxCnt = max(maxCnt, count)
    }
}
print(numberOfPic)
print(maxCnt)
