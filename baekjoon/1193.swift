//
//  1193.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/11.
//
//  분수찾기
//  https://www.acmicpc.net/problem/1193

let x = Int(readLine()!)!
var xPos = 1, yPos = 1
var cnt = 1
var zigzag = true
while cnt != x {
    if zigzag {
        xPos += 1
        yPos -= 1
        if yPos < 1 {
            yPos += 1
            zigzag = false
        }
    } else {
        xPos -= 1
        yPos += 1
    
        if xPos < 1 {
            xPos += 1
            zigzag = true
        }
    }
    cnt += 1
}
print("\(yPos)/\(xPos)")
