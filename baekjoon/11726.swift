//
//  0312_boj_11726.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/12.
//
//  2xn 타일링
//  https://www.acmicpc.net/problem/11726

// 다이나믹 - 문제를 나눌때 단계 1개 + 나머지 전체로 나누기
let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)

 //bottom to top
d[0] = 1
d[1] = 1

for i in 2...n {
    d[i] = (d[i-1] + d[i-2])%10007
}

print(d[n])

// top to bottom
func tile(num: Int) -> Int {
    if num == 1 { return 1 }
    if num == 2 { return 2 }

    if d[num] != 0 { return d[num] }
    d[num] = (tile(num: num-1) % 10007) + (tile(num: num-2) % 10007)

    return d[num] % 10007
}

let n = Int(readLine()!)!
var d = Array(repeating: 0, count: n+1)

for i in 1...n {
    if i <= 2 {
        d[i] = i
    } else {
        d[i] = (d[i-1] + d[i-2]) % 10007
    }
}

print(d[n])
