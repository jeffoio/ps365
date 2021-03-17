//
//  0317_boj_1051.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/17.
//
//  숫자 정사각형
//  https://www.acmicpc.net/problem/1051

var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
let n = input[0]
let m = input[1]
var square = [[Int]]()

for _ in 0..<n {
    square.append(Array(readLine()!).map{ Int(String($0))!})
}

var max = 0

for i in 0..<n {
    for j in 0..<m {
        var start = 1
        while true {
            if i+start >= n || j+start >= m { break }
            if square[i][j] == square[i][j+start] , square[i][j] == square[i+start][j], square[i][j] == square[i+start][j+start] {
                if max < start { max = start }
            }
           
            start += 1
        }
    }
}
print((max+1)*(max+1))
