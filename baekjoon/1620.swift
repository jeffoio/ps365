//
//  0329_boj_1620.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  나는야 포켓몬 마스터 이다솜
//  https://www.acmicpc.net/problem/1620

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], m = input[1]
var dic = [Int: String]()
var d = [String:Int]()
for i in 1...n {
    let input = readLine()!
    dic[i] = input
    d[input] = i
}
for _ in 0..<m {
    let input = readLine()!
    if Int(input) != nil {
        print(dic[Int(input)!]!)
    } else {
        print(d[input]!)
    }
}
