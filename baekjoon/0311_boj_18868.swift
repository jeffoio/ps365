//
//  0311_boj_18868.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/11.
//
//  멀티버스 Ⅰ
//  https://www.acmicpc.net/problem/18868

let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let M = input[0]
let N = input[1]
var sizeCompare = [[String]]()
var count = 0

for _ in 0..<M {
    let planetSize = readLine()!.split(separator: " ").map{Int(String($0))!}
    var compare = [String]()
    for i in 0..<planetSize.count {
        for j in i+1..<planetSize.count {
            if planetSize[i] < planetSize[j] { compare.append("<")}
            else if planetSize[i] > planetSize[j] { compare.append(">")}
            else { compare.append("=")}
        }
    }
    sizeCompare.append(compare)
}

for i in 0..<M {
    for j in i+1..<M {
        if sizeCompare[i] == sizeCompare[j] {
            count += 1
        }
    }
}

print(count)
