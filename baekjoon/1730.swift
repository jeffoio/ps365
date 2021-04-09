//
//  1730.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/09.
//
//  판화
//  https://www.acmicpc.net/problem/1730

let n = Int(readLine()!)!
var woodBlock = Array(repeating: Array(repeating:Character("."), count: n), count: n)
var moves = Array(readLine()!).map{Character(String($0))}
var cur = (0,0)


for move in moves {
    var newPos = moveing(pos: cur, dir: move)
    if newPos.0 < 0 || newPos.1 < 0 || newPos.0 >= n || newPos.1 >= n {
        continue
    }
    
    switch move {
    case "U", "D":
        if woodBlock[cur.1][cur.0] == "." || woodBlock[cur.1][cur.0] == "|" {
            woodBlock[cur.1][cur.0] = "|"
        } else {
            woodBlock[cur.1][cur.0] = "+"
        }
        if woodBlock[newPos.1][newPos.0] == "." || woodBlock[newPos.1][newPos.0] == "|" {
            woodBlock[newPos.1][newPos.0] = "|"
        } else {
            woodBlock[newPos.1][newPos.0] = "+"
        }
    case "R", "L":
        if woodBlock[cur.1][cur.0] == "." || woodBlock[cur.1][cur.0] == "-" {
            woodBlock[cur.1][cur.0] = "-"
        } else {
            woodBlock[cur.1][cur.0] = "+"
        }
        if woodBlock[newPos.1][newPos.0] == "." || woodBlock[newPos.1][newPos.0] == "-" {
            woodBlock[newPos.1][newPos.0] = "-"
        } else {
            woodBlock[newPos.1][newPos.0] = "+"
        }
    default:
        continue
    }
    cur = newPos
 
}
for i in woodBlock {
    print(i.map{String($0)}.joined())
}
func moveing(pos: (Int,Int), dir: Character) -> (Int,Int) {
    var newPos = pos
    
    switch dir {
    case "U":
        newPos.1 -= 1
    case "D":
        newPos.1 += 1
    case "L":
        newPos.0 -= 1
    case "R":
        newPos.0 += 1
    default:
        newPos = (0,0)
    }
    
    return newPos
}
