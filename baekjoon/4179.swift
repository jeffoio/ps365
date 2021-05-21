//
//  4179.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/21.
//
//  불!
//  https://www.acmicpc.net/problem/4179

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let r = input[0], c = input[1]
var board = [[String]]()
var fireQ = [(x:Int, y:Int)]()
var jQ = [(x:Int, y:Int)]()
var visited = Array(repeating: Array(repeating: false, count: c), count: r)
let dx = [0,1,0,-1], dy = [-1, 0, 1, 0]

for y in 0..<r {
    let input = Array(readLine()!).map{String($0)}
    for (x, char) in input.enumerated() {
        if char == "F" {
            fireQ.append((x,y))
        }
        if char == "J" {
            jQ.append((x,y))
            visited[y][x] = true
        }
        if char == "#" {
            visited[y][x] = true
        }
    }
    board.append(input)
}

var cnt = 0
var found = false

while !found && !jQ.isEmpty  {
    var nextFire = [(x:Int, y:Int)]()
    var nextJ = [(x:Int, y:Int)]()
    cnt += 1
    
    for pos in fireQ {
        for i in 0..<4 {
            let nx = pos.x + dx[i], ny = pos.y + dy[i]
            if nx < 0 || ny < 0 || nx >= c || ny >= r { continue }
            if board[ny][nx] == "J" || board[ny][nx] == "." {
                board[ny][nx] = "F"
                nextFire.append((nx,ny))
            }
        }
        
    }
    
    for jCur in jQ {
        board[jCur.y][jCur.x] = "J"
        for i in 0..<4 {
            let nx = jCur.x + dx[i], ny = jCur.y + dy[i]
            if nx < 0 || ny < 0 || nx >= c || ny >= r {
                found = true
                break
            }
            if visited[ny][nx] { continue }
            if board[ny][nx] == "." {
                nextJ.append((nx,ny))
                visited[ny][nx] = true
            }
        }
    }

    jQ = nextJ
    fireQ = nextFire
}

if found {
    print(cnt)
} else {
    print("IMPOSSIBLE")
}
