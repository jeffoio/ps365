//
//  0325_boj_17219.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/25.
//
//  비밀번호 찾기
//  https://www.acmicpc.net/problem/17219

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let N = input[0], M = input[1]

var password = [String:String]()
for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map({String($0)})
    password[input[0]] = input[1]
}

for _ in 0..<M {
    let input = readLine()!
    print(password[input]!)
}
