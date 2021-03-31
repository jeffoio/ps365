//
//  0329_boj_1940.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  주몽
//  https://www.acmicpc.net/problem/1940

let n = Int(readLine()!)!, m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map{Int(String($0))!}
var haveMaterial = Array(repeating: false, count: 10000001)
var count = 0
for num in numbers {
    haveMaterial[num] = true
}

for num in numbers {
    if (m-num) <= 0 { continue }
    if (m-num) != num, haveMaterial[m-num] {
        count += 1
        haveMaterial[m-num] = false
        haveMaterial[num] = false
    }
}

print(count)



/// 투포인터 방식
numbers.sort()

var left = 0, right = n-1, count = 0
while left < right {
    if numbers[left] + numbers[right] < m {
        left += 1
    } else if numbers[left] + numbers[right] > m {
        right -= 1
    } else {
        count += 1
        left += 1
        right -= 1
    }
}
print(count)
