//
//  17269.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/07.
//
//  이름궁합 테스트
//  https://www.acmicpc.net/problem/17269

let input = readLine()!.split(separator: " ").map({Int(String($0))!})
var a = input[0], b = input[1]
var names = readLine()!.split(separator: " ").map({String($0)})
var an = Array(names[0]).map{String($0)}, bn = Array(names[1]).map{String($0)}
var newname = [Int]()
var n = [3,2,1,2,4,3,1,3,1,1,3,1,3,2,1,2,2,2,1,2,1,1,1,2,2,1]
var next = [Int]()
while !an.isEmpty || !bn.isEmpty {
    if !an.isEmpty {
        let num = Int(Character(an.removeFirst()).asciiValue!) - 65
        newname.append(n[num])
    }
    if !bn.isEmpty {
        let num = Int(Character(bn.removeFirst()).asciiValue!) - 65
        newname.append(n[num])
    }
}

while newname.count != 2 {
    
    for i in 1..<newname.count {
        let sum = newname[i] + newname[i-1]
        next.append(sum%10)
    }
    
    newname = next
    next = [Int]()
}

var ans = newname.map{String($0)}.joined()
print("\(Int(ans)!)%")

