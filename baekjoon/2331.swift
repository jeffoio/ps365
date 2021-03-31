//
//  0319_boj_2331.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/19.
//
//  반복수열
//  
import  Foundation
var input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let a = input[0], p = input[1]
var n = a
var sequence = [a]

while true {
    let next = D(num: n)
    if sequence.contains(next) {
        print(sequence.firstIndex(of: next)!)
        break
    }
    sequence.append(next)
    n = next
}

func D(num: Int) -> Int {
    if num == 1 { return a }
    let n = Array(String(num)).map{ String($0)}
    var sum = 0
    for char in n {
        let change = pow(Decimal(Int(char)!), p)
        sum = sum + NSDecimalNumber(decimal: change).intValue
    }
    
    return sum
}
