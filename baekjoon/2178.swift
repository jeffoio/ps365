//
//  2178.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/03.
//
//  미로탐색
//  https://www.acmicpc.net/problem/2178

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var board = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [0,1,0,-1], dy = [1,0,-1,0]

for _ in 0..<n {
    board.append(Array(readLine()!).map{Int(String($0))!})
}

var q = [(x:0, y:0)]
visited[0][0] = true
var cnt = 0
loop: while !q.isEmpty {
    var nextQ = [(x:Int, y:Int)]()
    cnt += 1
    for cur in q {
        for i in 0..<4 {
            let nx = cur.x + dx[i], ny = cur.y + dy[i]
            if nx < 0 || ny < 0 || nx >= n || ny >= m { continue }
            if visited[nx][ny] || board[nx][ny] == 0 { continue }
            if (nx,ny) == (n-1, m-1) {
                break loop
            }
            visited[nx][ny] = true
            nextQ.append((nx,ny))
        }
    }
    q = nextQ
   
}
print(cnt+1)
