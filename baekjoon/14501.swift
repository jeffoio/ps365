//
//  14501.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/14.
//
//  퇴사
//  https://www.acmicpc.net/problem/14501

let n = Int(readLine()!)!
var t = [Int](), p = [Int]()
var max = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    t.append(input[0])
    p.append(input[1])
}

func dfs(startday: Int, money: Int) {
    let endDay = startday + t[startday]
    if startday > n || endDay > n{
        return
    }
   
    if money > max {
        max = money
        //print(startday,max)
    }
    for next in endDay..<n {
        dfs(startday: next, money: money + p[next])
    }
    
}

for i in 0..<n {
    dfs(startday: i, money: p[i])
}

print(max)
