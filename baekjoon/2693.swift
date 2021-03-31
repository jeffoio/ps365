//
//  0310_boj_2693.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/10.
//
//  N번째 큰 수
//  https://www.acmicpc.net/problem/2693

let testCount = Int(readLine()!)!

for _ in 0..<testCount {
    var array = readLine()!.split(separator: " ").map{ Int(String($0))! }
    array.sort(by: >)
    print(array[2])
}
