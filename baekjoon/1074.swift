//
//  0322_boj_1074.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/22.
//
//  Z
//  https://www.acmicpc.net/problem/1074

import Foundation
var input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0]
let r = input[1]
let c = input[2]


print(find(n: N, r: r, c: c))

func find(n:Int , r:Int , c:Int) -> Int {
    if n == 1 {
        if r == 0 {
            if c == 0 { return 0 }
            else { return 1}
        } else {
            if c==0 { return 2 }
            else { return 3 }
        }
    }
    
    var quadrant = 0
    let maxR = Int(pow(2.0, Double(n)))
    let numberOfCountInQuadrant = (maxR*maxR)/4
    if r < (maxR/2) {
        if c < maxR/2 {
            quadrant = 0
        } else {
           quadrant = 1
        }
    } else {
        if c < maxR/2 {
            quadrant = 2
        } else {
            quadrant = 3
        }
    }
    var nr = r
    var nc = c
    
    if nr >= maxR/2 {
        nr-=maxR/2
    }
    if nc >= maxR/2 {
        nc-=maxR/2
    }
    
    return numberOfCountInQuadrant*quadrant + find(n: n-1, r: nr, c: nc)
}



