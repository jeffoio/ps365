//
//  14620.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/19.
//
//  꽃길
//  https://www.acmicpc.net/problem/14620

let n = Int(readLine()!)!
var price = [[Int]](), sumPrice = [[Int]]()
var visit = Array(repeating: Array(repeating: false, count: n), count: n)

var min = Int.max
let dx = [0,1,0,-1], dy = [-1,0,1,0]

for _ in 0..<n {
    price.append(readLine()!.split(separator: " ").map{Int(String($0))!})
    sumPrice.append(Array(repeating: -1, count: n))
}

for y in 0..<n {
    for x in 0..<n {
        var chk = true, sum = 0
                
        for move in 0..<4 {
            let nx = x + dx[move], ny = y + dy[move]
            if nx < 0 || ny < 0 || nx >= n || ny >= n {
                chk = false
                break
            }
            sum += price[ny][nx]
        }
        
        if chk {
            sumPrice[y][x] = sum + price[y][x]
        }
    }
}

func backtracking(count: Int, cost: Int, visited: [[Bool]]) {
    if cost >= min {
        return
    }
    if count == 3 {
        min = cost
        return
    }
    var visited = visited
    
    for y in 0..<n {
        for x in 0..<n {
            if sumPrice[y][x] == -1 || visited[y][x] { continue }
            if !check(x: x, y: y, visited: visited) { continue }
            
            for move in 0..<4 {
                let nx = x + dx[move], ny = y + dy[move]
                visited[ny][nx] = true
            }
            
            visited[y][x] = true
            backtracking(count: count+1, cost: cost + sumPrice[y][x], visited: visited)
            
            for move in 0..<4 {
                let nx = x + dx[move], ny = y + dy[move]
                visited[ny][nx] = false
            }
            visited[y][x] = false
        }
    }
}

backtracking(count: 0, cost: 0, visited: visit)

print(min)


func check(x: Int, y: Int, visited: [[Bool]]) -> Bool {
    let dx = [0,1,0,-1], dy = [-1,0,1,0]
    
    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if visited[ny][nx] {
            return false
        }
    }
    
    return true
}
