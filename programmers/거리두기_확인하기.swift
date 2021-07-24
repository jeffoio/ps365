//
//  거리두기_확인하기.swift
//  codingtest
//
//  Created by jeff on 2021/07/24.
//
//  거리두기 확인하기
//  https://programmers.co.kr/learn/courses/30/lessons/81302

import Foundation

func solution(_ places:[[String]]) -> [Int] {
    let manhatten1X = [-1,0,1,0], manhatten1Y = [0,1,0,-1]
    let diagonalX = [-1,-1,1,1],  diagonalY = [-1,1,1,-1]
    var answer = [Int]()
    for place in places {
        var check = 1
        let waitingRoom = make2D(place: place)
        
        loop: for x in 0..<5 {
            for y in 0..<5 {
                if waitingRoom[x][y] != "P" { continue }
                
                //위아래좌우
                for idx in 0..<4 {
                    let nx = x+manhatten1X[idx], ny = y+manhatten1Y[idx]
                    if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 { continue }
                    if waitingRoom[nx][ny] == "P" {
                        check = 0
                        break loop
                    }
                }
                
                // 대각선
                for idx in 0..<4 {
                    let nx = x+diagonalX[idx], ny = y+diagonalY[idx]
                    if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 { continue }
                    if waitingRoom[nx][ny] == "P" {
                        // 파티션체크
                        if waitingRoom[nx][y] != "X" || waitingRoom[x][ny] != "X" {
                            check = 0
                            break loop
                        }
                    }
                }
                
                // 2칸
                for idx in 0..<4 {
                    let nx = x+manhatten1X[idx]*2, ny = y+manhatten1Y[idx]*2
                    if nx < 0 || ny < 0 || nx >= 5 || ny >= 5 { continue }
                    if waitingRoom[nx][ny] == "P" {
                        let px = x+manhatten1X[idx], py = y+manhatten1Y[idx]
                        if waitingRoom[px][py] != "X" {
                            check = 0
                            break loop
                        }
                        
                    }
                }
            }
        }
        answer.append(check)
    }

    return answer
}

func make2D(place: [String]) -> [[String]] {
    var twoD = [[String]]()
    for str in place {
        twoD.append(Array(str).map{String($0)})
    }
    return twoD
}
