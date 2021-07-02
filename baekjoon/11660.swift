//
//  11660.swift
//  codingtest
//
//  Created by jeff on 2021/07/02.
//

//  구간 합 구하기 5
//  https://www.acmicpc.net/problem/11660

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var board = [[Int]]()
var preFix = Array(repeating: Array(repeating: 0, count: n), count: n)
for x in 0..<n {
    board.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    
    for y in 0..<n {
        if x-1 >= 0 { preFix[x][y] += preFix[x-1][y]}
        if y-1 >= 0 { preFix[x][y] += preFix[x][y-1]}
        if x-1>=0, y-1>=0 { preFix[x][y] -= preFix[x-1][y-1]}
        preFix[x][y]+=board[x][y]
    }
}

var answer = ""

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!-1}
    let (x1,y1,x2,y2) = (input[0],input[1],input[2],input[3])
    var sum = preFix[x2][y2]
    if y1-1 >= 0 { sum -= preFix[x2][y1-1]}
    if x1-1 >= 0 { sum -= preFix[x1-1][y2] }
    if x1-1>=0, y1-1>=0 { sum += preFix[x1-1][y1-1]}
    answer += "\(sum)\n"
}
print(answer)
