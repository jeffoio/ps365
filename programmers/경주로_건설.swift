//
//  경주로_건설.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/23.
//
//  [카카오 인턴] 경주로 건설
//  https://programmers.co.kr/learn/courses/30/lessons/67259

import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    let leftNRight:[(x: Int, y:Int)] = [(0,-1),(0,1) ], topDown:[(x: Int, y:Int)] = [ (1,0), (-1,0)]
    var minimumCost = Int.max
    var q = [(x: Int, y:Int, cost: Int, direction: Int)]()
    var visitCost = Array(repeating: Array(repeating: Int.max, count: n), count: n)
    q.append((0,0,0,0))
    
    while !q.isEmpty {
        let current = q.removeFirst()
        if (current.x,current.y) == (n-1,n-1) {
            if minimumCost > current.cost {
                minimumCost = current.cost
            }
            continue
        }
        
        for move in leftNRight {
            let cur = current
            let newPos:(x: Int, y:Int) = (cur.x+move.x, cur.y+move.y)
            if newPos.x < 0 || newPos.y < 0 || newPos.x >= n || newPos.y >= n { continue }
            if board[newPos.y][newPos.x] == 1 { continue }
            var cost = cur.cost + 100
            if cur.direction == 2 {
                cost += 500
            }
            if visitCost[newPos.y][newPos.x] < cost { continue }
            visitCost[newPos.y][newPos.x] = cost
            q.append((newPos.x,newPos.y,cost,1))
        }
        
        for move in topDown {
            let cur = current
            let newPos:(x: Int, y:Int) = (cur.x+move.x, cur.y+move.y)
            if newPos.x < 0 || newPos.y < 0 || newPos.x >= n || newPos.y >= n { continue }
            if board[newPos.y][newPos.x] == 1 { continue }
            var cost = cur.cost + 100
            if cur.direction == 1 {
                cost += 500
            }
            if visitCost[newPos.y][newPos.x] < cost { continue }
            visitCost[newPos.y][newPos.x] = cost
            q.append((newPos.x,newPos.y,cost,2))
        }
        
    }
    return minimumCost
}
