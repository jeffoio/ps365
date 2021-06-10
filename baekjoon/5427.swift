//
//  5427.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/11.
//
//  불
//  https://www.acmicpc.net/problem/5427

let t = Int(readLine()!)!
var answer = ""
let dx = [-1,0,1,0], dy = [0,1,0,-1]
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map( {Int(String($0))!})
    let w = input[0], h = input[1]
    var board = [[String]]()
    var pvisited = Array(repeating: Array(repeating: false, count: w), count: h)
    var playerQ = [(x:Int, y:Int)](), fireQ = [(x:Int, y:Int)]()
    var isSurvive = false
    var count = 0
    var fireDist = Array(repeating: Array(repeating: -1, count: w), count: h)

    for x in 0..<h {
        let input = Array(readLine()!).map{String($0)}
        for y in 0..<w {
            if input[y] == "@" {
                playerQ = [(x,y)]
                pvisited[x][y] = true
            }
            if input[y] == "*" {
                fireQ.append((x,y))
                fireDist[x][y] = 0
            }
        }
        board.append(input)
    }
    
    while !fireQ.isEmpty {
        var nextFireQ = [(x:Int, y:Int)]()
        count += 1
        for cur in fireQ {
            for idx in 0..<4 {
                let nx = cur.x + dx[idx], ny = cur.y + dy[idx]
                if nx < 0 || ny < 0 || nx >= h || ny >= w || fireDist[nx][ny] > -1 { continue }
                if board[nx][ny] == "#" { continue }
                fireDist[nx][ny] = count
                
                nextFireQ.append((nx,ny))
            }
        }
        fireQ = nextFireQ
    }
    count = 0
    
    loop: while !playerQ.isEmpty {
        var nextPlayerQ = [(x:Int, y:Int)]()
        count += 1
        for cur in playerQ {
            for idx in 0..<4 {
                let nx = cur.x + dx[idx], ny = cur.y + dy[idx]
                if nx < 0 || ny < 0 || nx >= h || ny >= w {
                    isSurvive = true
                    break loop
                }
                if (fireDist[nx][ny] != -1 && fireDist[nx][ny] <= count) || pvisited[nx][ny] { continue }
                if board[nx][ny] == "." {
                    pvisited[nx][ny] = true
                    nextPlayerQ.append((nx,ny))
                }
                
            }
        }
        playerQ = nextPlayerQ
    }

    if isSurvive {
        answer.append("\(count)\n")
    } else {
        answer.append("IMPOSSIBLE\n")
    }
    
}
print(answer)
