//
//  1065.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/15.
//
//  한수
//  https://www.acmicpc.net/problem/1065

var n = Int(readLine()!)!
var count = 0

while n >= 1 {
    if isHansu(num: n) {
        count += 1
    }
    
    n-=1
}
print(count)


func isHansu(num: Int) -> Bool {
    if num <= 10 {
        return true
    }
    let arr = Array(String(num)).map{Int(String($0))!}
    let diff = arr[1] - arr[0]
    
    for i in 1..<arr.count {
        if arr[i]-arr[i-1] != diff  {
            return false
        }
    }
    
    return true
}


