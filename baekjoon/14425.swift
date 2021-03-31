//
//  0318_boj_14425.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  문자열 집합
//  https://www.acmicpc.net/problem/14425

var input = readLine()!.split(separator: " ").map{ Int(String($0))!}
var setS = [String: Int]()
var count = 0
for i in 0..<input[0] {
    setS[readLine()!] = 1
}

for i in 0..<input[1] {
    let string = readLine()!
    if setS[string] != nil {
        count += 1
    }
}
print(count)
