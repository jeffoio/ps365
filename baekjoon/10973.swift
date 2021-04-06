//
//  10973.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/06.
//
//  이전 순열
//  https://www.acmicpc.net/problem/10973

let n = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{Int(String($0))!}
var bigI: Int?

for i in 0..<n {
    if i+1 < n, find[i] > find[i+1] {
        bigI = i
    }
}

if bigI == nil {
    print(-1)
} else {
    var max = 0, bigj = 0
    for j in (bigI!+1)..<n {
        if find[j] > max , find[j] < find[bigI!]{
            max = find[j]
            bigj = j
        }
    }
    find.swapAt(bigI!, bigj)
    find = find[...bigI!] + find[(bigI!+1)...].sorted(by: >)
    print(find.map{String($0)}.joined(separator: " "))
}
