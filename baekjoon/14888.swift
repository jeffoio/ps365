//
//  14888.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/28.
//
//  연산자 끼워넣기
//  https://www.acmicpc.net/problem/14888

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
var operators = [String]()
var maxSum = Int.min, minSum = Int.max

for i in 0..<4 {
    var op = ""
    if i == 0 { op = "+" }
    if i == 1 { op = "-" }
    if i == 2 { op = "*" }
    if i == 3 { op = "/" }
    
    for _ in 0..<input[i] {
        operators.append(op)
    }
}
var visited = Array(repeating: false, count: n-1)
dfs(operators, pick: 0, sum: numbers[0], visited: visited )
print(maxSum)
print(minSum)


func dfs(_ op: [String], pick: Int, sum:Int, visited: [Bool]) {
    if pick == op.count {
        maxSum = max(maxSum, sum)
        minSum = min(minSum, sum)
        return
    }
    var visited = visited, newSum = sum
    for idx in 0..<op.count {
        if visited[idx] { continue }
        visited[idx] = true
        if op[idx] == "+" { newSum += numbers[pick+1] }
        if op[idx] == "-" { newSum -= numbers[pick+1] }
        if op[idx] == "*" { newSum *= numbers[pick+1] }
        if op[idx] == "/" { newSum /= numbers[pick+1] }
        dfs(op, pick: pick+1, sum: newSum, visited: visited)
       
        visited[idx] = false
        newSum = sum
    }
}
