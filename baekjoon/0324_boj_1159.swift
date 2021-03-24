//
//  0324_boj_1159.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/24.
//
//  농구 경기
//  https://www.acmicpc.net/problem/1159

var caseCount = Int(readLine()!)!
var names = [String:Int]()
for _ in 0..<caseCount {
    var input = readLine()!
    let last = String(input.removeFirst())
    if names[last] == nil { names[last] = 1}
    else {
        names[last] = names[last]! + 1
    }
}
names = names.filter { $0.value >= 5 }
var s = Array(names.keys).map{ String($0)}
s.sort()
if s.isEmpty {
    print("PREDAJA")
} else {
    for i in s {
        print(i, terminator:"")
    }
}
