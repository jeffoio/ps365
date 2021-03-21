//
//  0321_boj_2573.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/21.
//
// 빙산
//  https://www.acmicpc.net/problem/2573

let size = readLine()!.split(separator: " ").map{Int(String($0))!}

let n = size[0] // n
let m = size[1] // m
var iceberg = [[Int]]()
var year = 0
var pieceCount = 1

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{Int(String($0))!}
    iceberg.append(line)
}


while pieceCount != 0 {
    var changeIceberg = iceberg
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    pieceCount = 0
    for nidx in 0..<n {
        for midx in 0..<m {
            if iceberg[nidx][midx] == 0 || visited[nidx][midx] { continue } // 바다 건너뜀
            var queue = [(x:Int,y:Int)]()
            let dx = [-1,0,1,0]
            let dy = [0,1,0,-1]
            
            // 방문할 지점 큐에 넣기
            visited[nidx][midx] = true
            queue.append((nidx,midx))
            while !queue.isEmpty {
                let cur = queue.removeFirst()
                var waterCount = 0
                // 4방향 체크
                for i in 0...3 {
                    // 범위 초과 확인
                    let xCheck = dx[i] + cur.x
                    let yCheck = dy[i] + cur.y
                    if xCheck < 0 || xCheck >= n ||  yCheck < 0 || yCheck >= m { continue }
                    if iceberg[xCheck][yCheck] == 0 {
                        waterCount += 1
                        visited[xCheck][yCheck] = true
                        continue
                    }
                    if visited[xCheck][yCheck] { continue }
                    
                    visited[xCheck][yCheck] = true
                    queue.append((xCheck,yCheck))
                }
                if changeIceberg[cur.x][cur.y] > waterCount {
                    changeIceberg[cur.x][cur.y] = changeIceberg[cur.x][cur.y] - waterCount
                } else {
                    changeIceberg[cur.x][cur.y] = 0
                }
            
            }
            
            pieceCount += 1 //
        }
    }
    if pieceCount > 1 { break }
    iceberg = changeIceberg
    year += 1
}
if pieceCount == 0 { print(0) }
else {
    print(year)
}
