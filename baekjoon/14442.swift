//
//  14442.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/16.
//
//  벽 부수고 이동하기 2
//  https://www.acmicpc.net/problem/14442

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (n,m,k) = (input[0], input[1],input[2])
var board = [[Bool]]()
var q = [(x:Int, y: Int, possibleBreak: Int)]()
let dx = [-1,0,1,0], dy = [0,1,0,-1]
var count = 0, isArrived = false
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 11), count: m), count: n)
for i in 0..<k {
    visited[0][0][i] = true
}
for _ in 0..<n {
    board.append(Array(readLine()!).map{ $0=="0" ? true : false})
}
q = [(0,0,k)]
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
            
            if visited[nx][ny][cur.possibleBreak] { continue }
            
            if !board[nx][ny] { //벽일때
                if cur.possibleBreak == 0 { continue }
                visited[nx][ny][cur.possibleBreak-1] = true
                nextQ.append((nx,ny,cur.possibleBreak-1))
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
