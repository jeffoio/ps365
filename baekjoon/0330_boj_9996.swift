//
//  0330_boj_9996.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/30.
//
//  한국이 그리울 땐 서버에 접속하지
//  https://www.acmicpc.net/problem/9996

let test = Int(readLine()!)!
var pattern = Array(readLine()!).map{String($0)}

for _ in 0..<test {
    let input = Array(readLine()!).map{String($0)}
    if input.count - (pattern.count-1) < 0 {
        print("NE")
        continue
    }
    let newStar = String(repeating: "*", count: input.count-(pattern.count-1))
    var check = true
    var newPattern = pattern.map { (str: String) -> String in
        if str == "*" {
            return newStar
        } else {
            return str
        }
    }
    var temp = newPattern.joined()
    newPattern = Array(temp).map{String($0)}
    
    for i in 0..<newPattern.count {
        if newPattern[i] == "*" { continue }
        if newPattern[i] != input[i] {
            check = false
            break
        }
    }
    
    if check {
        print("DA")
    } else {
        print("NE")
    }
}
