//
//  0330_boj_2852.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/30.
//
//  NBA 농구
//  https://www.acmicpc.net/problem/2852

import Foundation

let n = Int(readLine()!)!
var scoreInfo = [Int]()
var info = [(min: Int, sec: Int)]()
for _ in 0..<n {
    let i = readLine()!.split(separator: " ")
    let score = Int(i[0])!
    let time = i[1].split(separator: ":").map{Int(String($0))!}
    scoreInfo.append(score)
    info.append((time[0],time[1]))
}

var scoreBoard = (a: 0, b:0)
var aWin = 0
var bWin = 0
var tIdx = 0
for min in 0..<48 {
    for sec in 0..<60 {
        let scoreTime = info.filter {
            if $0.0 == min, $0.1 == sec {
                return true
            }
            else {
                return false
            }
        }
        if !scoreTime.isEmpty {
            if scoreInfo[tIdx] == 1 {
                scoreBoard.a += 1
            } else {
                scoreBoard.b += 1
            }
            tIdx += 1
        }
        
        if scoreBoard.a < scoreBoard.b {
            bWin += 1
        }
        
        if scoreBoard.a > scoreBoard.b {
            aWin += 1
        }
    }
}

print("\(String(format: "%02d",aWin/60)):\(String(format: "%02d",aWin%60))")
print("\(String(format: "%02d",bWin/60)):\(String(format: "%02d",bWin%60))")
