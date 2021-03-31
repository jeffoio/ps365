//
//  0326_boj_10709.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/26.
//
//  기상캐스터
//  https://www.acmicpc.net/problem/10709

let info = readLine()!.split(separator: " ").map{ Int(String($0))! }
let h = info[0], w = info[1]
var board = Array(repeating: Array(repeating: -1, count: w), count: h)

for i in 0..<h {
    let input = Array(readLine()!).map{String($0)}
    var chkCloud = false
    var cloud = 0
    for j in 0..<w {
        
        if input[j] == "c" {
            board[i][j] = 0
            chkCloud = true
            cloud = 0
        }
        if chkCloud, input[j] == "." {
            cloud += 1
            board[i][j] = cloud
        }
        
    }
    
}

for i in 0..<h {
    for j in 0..<w {
        print(board[i][j], terminator: " ")
    }
    print("")
}
