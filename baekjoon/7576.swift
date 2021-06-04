//
//  7576.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/04.
//
// 토마토
//  https://www.acmicpc.net/problem/7576

let input = readLine()!.split(separator: " ").map({Int(String($0))!})
let m = input[0], n = input[1]
var board = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
let dx = [-1,0,1,0], dy = [0,1,0,-1]
var dayPass = 0
var q = [(x: Int, y: Int)]()
for x in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
    for y in 0..<m {
        if input[y] == 1 { q.append((x,y)); visited[x][y] = true }
    }
}

while !q.isEmpty {
    var nextQ = [(x: Int, y: Int)]()
    
    for cur in q {
        for i in 0..<4 {
            let nx = cur.x + dx[i], ny = cur.y + dy[i]
            if nx<0 || ny<0 || nx>=n || ny>=m { continue }
            if visited[nx][ny] || board[nx][ny] != 0  { continue }
            visited[nx][ny] = true
            board[nx][ny] = 1
            nextQ.append((nx,ny))
        }
    }
    
    q = nextQ
    dayPass += 1
}

if board.flatMap({ $0 }).contains(0) {
    print(-1)
} else {
    print(dayPass-1)
}
