//
//  10814.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/08.
//
//  나이순 정렬
//  https://www.acmicpc.net/problem/10814

let n = Int(readLine()!)!
var arr = [(age:Int, name:String, order: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map{String($0)}
    arr.append((Int(input[0])!, input[1], i))
}

arr.sort {
    if $0.age == $1.age {
        return $0.order < $1.order
    } else {
        return $0.age < $1.age
    }
}

for i in arr {
    print("\(i.age) \(i.name)")
}