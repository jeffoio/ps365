//
//  2206.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/16.
//
// 벽 부수고 이동하기
//  https://www.acmicpc.net/problem/2206

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var board = [[Bool]]()
var q = [(x:Int, y: Int, possibleBreak: Int)]()
let dx = [-1,0,1,0], dy = [0,1,0,-1]
var count = 0, isArrived = false
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: m), count: n)
visited[0][0][0] = true; visited[0][0][1] = true
for _ in 0..<n {
    board.append(Array(readLine()!).map{ $0=="0" ? true : false})
}
q = [(0,0,0)]

loop: while !q.isEmpty {
    var nextQ = [(x:Int, y: Int, possibleBreak: Int)]()
    count += 1
    for cur in q {
        if cur.x == (n-1), cur.y == (m-1) {
            isArrived = true
            break loop
        }
        for i in 0..<4 {
            let nx = cur.x+dx[i], ny = cur.y+dy[i]
            if nx<0 || ny<0 || nx>=n || ny>=m { continue }
            
            
            if cur.possibleBreak == 0 { // 벽안뿌심
                if visited[nx][ny][cur.possibleBreak] { continue }
            } else {
                if visited[nx][ny][cur.possibleBreak] { continue }
            }
            
            if !board[nx][ny] { //벽
                if cur.possibleBreak == 1 { continue }
                visited[nx][ny][cur.possibleBreak] = true
                nextQ.append((nx,ny,1))
                continue
            }
            
            visited[nx][ny][cur.possibleBreak] = true
            nextQ.append((nx,ny,cur.possibleBreak))
        }
    }
    q = nextQ
    
}

if isArrived {
    print(count)
} else {
    print(-1)
}
