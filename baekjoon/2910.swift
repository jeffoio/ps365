//
//  0330_boj_2910.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/30.
//
//  빈도 정렬
//  https://www.acmicpc.net/problem/2910

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0], c = input[1]
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var storage = Array(repeating: (num: 0, count: 0), count: numbers.max()!+1)

for num in numbers {
    if storage[num] == (0,0) {
        storage[num] = (num, 1)
    } else {
        storage[num] = (num,storage[num].count+1)
    }
}

storage = storage.filter { $0 != (0,0)}
storage = storage.sorted {
    if $0.count == $1.count {
        let leftIdx = numbers.firstIndex(of: $0.num)!
        let rightIdx = numbers.firstIndex(of: $1.num)!
        return leftIdx < rightIdx
    } else {
        return $0.count > $1.count
    }
}

for i in storage {
    for _ in 0..<i.count {
        print(i.num, terminator: " ")
    }
}
