//
//  11399.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/09.
//
//  ATM
//  https://www.acmicpc.net/problem/11399

import Foundation

var n = Int(readLine()!)
var times = readLine()!.components(separatedBy: " ").map{ Int(String($0))! }
//var times = [3,1,4,3,2]
var sum = 0
var waitingTime = 0
times.sort(by: <)

for time in times {
    sum += time
    waitingTime += sum
}

print(waitingTime)
