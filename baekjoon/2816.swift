//
//  0324_boj_2816.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/24.
//
//  디지털 티비
//  https://www.acmicpc.net/problem/2816

let N = Int(readLine()!)!
var list = [String]()
var curPos = 0
var k1Pos = 1
var k2Pos = 0
for i in 0..<N {
    let input = readLine()!
    if input == "KBS1" { k1Pos = i }
    if input == "KBS2" { k2Pos = i }
    list.append(input)
}

var answer = ""
while k1Pos != 0 {
    if curPos == k1Pos {
        list.swapAt(curPos, curPos-1)
        answer.append("4")
        curPos-=1
        k1Pos-=1
    } else {
        curPos += 1
        answer.append("1")
    }
    
}

k2Pos = list.firstIndex(of: "KBS2")!
while k2Pos != 1 {
    if curPos == k2Pos {
        list.swapAt(curPos, curPos-1)
        answer.append("4")
        curPos-=1
        k2Pos-=1
    } else {
        curPos += 1
        answer.append("1")
    }

}

print(answer)


