//
//  0317_boj_2108.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/17.
//
//  통계학
//  
import Foundation

var N = Int(readLine()!)!
var min = 4000
var max = -4000
var numbers = [Int]()
var sum = 0
var frequency = [Int:Int]()

for _ in 0..<N {
    let number = Int(readLine()!)!
    if number < min { min = number}
    if number > max { max = number}
    sum += number
    numbers.append(number)
    
    if frequency[number] == nil {
        frequency[number] = 1
    } else {
        frequency[number] = frequency[number]! + 1
    }
}

var maxFrequency = Array(frequency.values).map{ Int($0)}.max()!
var maxArray = [Int]()
for num in frequency {
    if num.value == maxFrequency { maxArray.append(num.key)}
}
numbers.sort()
maxArray = Array(Set(maxArray))
print(Int((Double(sum)/Double(N)).rounded()))
print(numbers[(N-1)/2])
if maxArray.count == 1 {
    print(maxArray[0])
} else {
    maxArray.sort()
    print(maxArray[1])
}

print(max-min) //범위
