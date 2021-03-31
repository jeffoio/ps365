//
//  0325_boj_2870.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/25.
//
//  수학숙제
//  https://www.acmicpc.net/problem/2870

import Foundation

let N = Int(readLine()!)!
var numbers = [String]()

for _ in 0..<N {
    let alphabet = CharacterSet(charactersIn: "a"..."z")
    let input = readLine()!.components(separatedBy: alphabet)
    var num = input.filter {!$0.isEmpty}
    
    for i in 0..<num.count {
        if num[i].count > 1, num[i].first == "0" {
            num[i].removeFirst()
            while num[i].first == "0" {
                num[i].removeFirst()
            }
            if num[i].isEmpty { num[i] = "0"}
        }
    }
    numbers += num
}

numbers = numbers.sorted {
    if $0.count == $1.count {
        return $0 < $1
    }
    return $0.count < $1.count
}

for num in numbers {
    print(num)
}
