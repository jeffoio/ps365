//
//  0308_boj_7568.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/08.
//
//  덩치
//  https://www.acmicpc.net/problem/7568

typealias person = (weight: Int, height: Int)
let N = Int(readLine()!)!
var people = [person]()

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    people.append((input[0],input[1]))
}

for p in people {
    let condition = people.filter { p.weight < $0.weight && p.height < $0.height}
    print(condition.count+1, terminator: " ")
}
