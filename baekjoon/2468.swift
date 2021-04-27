//
//  2468.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/27.
//
//  안전 영역
//  https://www.acmicpc.net/problem/2468

let n = Int(readLine()!)!
var board = [[Int]]()
var maxSafe = 1
let dx = [0,1,0,-1], dy = [-1,0,1,0]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
}

for height in 0...100 {
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    var possibleSafe = [(x: Int, y:Int)]()
    var cnt = 0
    
    for y in 0..<n {
        for x in 0..<n {
            if board[y][x] <= height {
                visited[y][x] = true
            } else {
                possibleSafe.append((x,y))
            }
        }
    }
    for pos in possibleSafe {
        if visited[pos.y][pos.x] { continue }
        dfs(x: pos.x, y: pos.y, visited: &visited)
        cnt += 1
    }
    maxSafe = max(cnt, maxSafe)
}

print(maxSafe)

func dfs(x:Int, y:Int, visited: inout [[Bool]]) {
    for i in 0..<4 {
        let newPos = (x: x+dx[i], y: y+dy[i])
        if newPos.x < 0 || newPos.y < 0 || newPos.x >= n || newPos.y >= n {
            continue
        }
        if visited[newPos.y][newPos.x] { continue }
        visited[newPos.y][newPos.x] = true
        dfs(x: newPos.x, y: newPos.y, visited: &visited)
    }
}
