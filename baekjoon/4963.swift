//
//  4963.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/05.
//
//  섬의 개수
//  https://www.acmicpc.net/problem/4963

while true {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    if input == [0,0] {
        break
    }
    let w = input[0], h = input[1]
    var board = [[Int]]()
    var visited = Array(repeating: Array(repeating: false, count: w), count: h)
    var count = 0
    for _ in 0..<h {
        board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    }
    
    for i in 0..<h {
        for j in 0..<w {
            if board[i][j] == 0 || visited[i][j] {
                continue
            }
            var queue = [(i,j)]
            let dxy = [(-1,-1),(-1,0),(-1,1),(0,1),(1,1),(1,0),(1,-1),(0,-1)]
            count += 1
            while !queue.isEmpty {
                let pos = queue.removeFirst()
                if visited[pos.0][pos.1] {
                    continue
                }
                visited[pos.0][pos.1] = true
                for d in dxy {
                    let newPos = (pos.0 + d.0, pos.1+d.1)
                    if newPos.0 < 0 || newPos.0 >= h || newPos.1 < 0 || newPos.1 >= w {
                        continue
                    }
                    if board[newPos.0][newPos.1] == 1 , !visited[newPos.0][newPos.1] {
                        queue.append(newPos)
                    }
                }
            }
        }
    }
    
    print(count)
}
