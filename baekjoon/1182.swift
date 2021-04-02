//
//  1182.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/02.
//
//  부분수열의 합
//  https://www.acmicpc.net/problem/1182

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], s = input[1]
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var count = 0

func backtracking(pickedCount: Int, sum: Int) {
    if pickedCount == n{
        if sum == s {
            count += 1
        }
        return
    }

    backtracking(pickedCount: pickedCount+1, sum: sum + numbers[pickedCount])
    backtracking(pickedCount: pickedCount+1, sum: sum )
    
}
backtracking(pickedCount: 0, sum: 0)
if s == 0 {
    count -= 1
}
print(count)
