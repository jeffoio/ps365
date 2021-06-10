//
//  6593.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/10.
//
//  상범빌딩
//  https://www.acmicpc.net/problem/6593

var answer = ""
while true  {
    var building = readLine()!.split(separator: " ").map{Int(String($0))!}
    if building == [0,0,0] { break }
    let l = building[0], r = building[1], c = building[2]
    var board = [[[String]]]()
    var q = [(x:Int, y:Int, z:Int)]()
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: c), count: r), count: l)
    let dx = [0,-1,0,1], dy = [-1,0,1,0], dz = [-1,1]
    
    for z in 0..<l {
        var temp = [[String]]()
        for x in 0..<r {
            let input = Array(readLine()!).map{String($0)}
            if let index = input.firstIndex(of: "S") {
                q = [(x,index,z)]
                visited[z][x][index] = true
            }
            temp.append(input)
        }
        board.append(temp)
        _ = readLine()!
    }
    
    var count = 0
    var find = false
//    for i in board {
//        for j in i {
//            print(j)
//        }
//    }
    loop: while !q.isEmpty {
        var newQ = [(x:Int, y:Int, z:Int)]()
        count += 1
        for cur in q {
            //상하좌우
            for idx in 0..<4 {
                let nx = cur.x + dx[idx], ny = cur.y + dy[idx]
                if nx < 0 || ny < 0 || nx >= r || ny >= c   { continue }
                if visited[cur.z][nx][ny] { continue }
                if board[cur.z][nx][ny] == "." {
                    newQ.append((nx,ny,cur.z))
                }
                visited[cur.z][nx][ny] = true
                if board[cur.z][nx][ny] == "E" {
                    find = true
                    break loop
                }
            }
            //위아래
            for idx in 0..<2 {
                let nz = cur.z + dz[idx]
                if nz < 0 || nz >= l || visited[nz][cur.x][cur.y] { continue }
                if board[nz][cur.x][cur.y] == "." {
                    newQ.append((cur.x,cur.y,nz))
                }
                visited[nz][cur.x][cur.y] = true
                if board[nz][cur.x][cur.y] == "E" {
                    find = true
                    break loop
                }
            }
        }
        q = newQ
    }
    if find {
        answer.append("Escaped in \(count) minute(s).\n")
    } else {
        answer.append("Trapped!\n")
    }

    
}

print(answer)
