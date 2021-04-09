//
//  9037.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/09.
//
//  The candy war
//  https://www.acmicpc.net/problem/9037

let T = Int(readLine()!)!

for _ in 0..<T {
    let n = Int(readLine()!)!
    var candy = readLine()!.split(separator: " ").map{Int(String($0))!}
    var shift = Array(repeating: 0, count: candy.count)
    var count = 0
    candy = fillOdd(candy: candy)

    while Set(candy).count != 1 {
        candy = candy.map{ $0/2 }
        for i in 0..<n {
            shift[(i+1)%n] = candy[i]
        }
        for i in 0..<n {
            candy[i] = candy[i] + shift[i]
        }
        candy = fillOdd(candy: candy)
        count += 1
    }
    
    print(count)
}



func fillOdd(candy: [Int]) -> [Int] {
    var candy = candy
    candy = candy.map{ c in
        if c%2 == 0 {
            return c
        } else {
            return c + 1
        }
    }
    
    return candy
}
