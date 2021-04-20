//
//  10819.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/20.
//
//  차이를 최대로
//  https://www.acmicpc.net/problem/10819

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var storage = [[Int]]()
var max = 0

permutaion(total: numbers, n: numbers.count - 1, storage: &storage)

for i in storage {
    let sum = calculate(numbers: i)
    if  sum > max {
        max = sum
    }
}

print(max)

func permutaion<T>(total: [T], n: Int, storage: inout [[T]]) {
    if n == 0 {
        storage.append(total)
    } else {
        var total = total
        permutaion(total: total, n: n-1, storage: &storage)
        
        for i in 0..<n {
            total.swapAt(i, n)
            permutaion(total: total, n: n-1, storage: &storage)
            total.swapAt(i, n)
        }
    }
}

func calculate(numbers: [Int]) -> Int {
    var sum = 0
    
    for i in 2...numbers.count {
        sum += abs(numbers[i-2] - numbers[i-1])
    }
    
    return sum
}
