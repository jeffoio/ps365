//
//  10972.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/06.
//
//  다음 순열
//  https://www.acmicpc.net/problem/10972

let n = Int(readLine()!)!
var find = readLine()!.split(separator: " ").map{ Int(String($0))!}

if Array(1...n).reversed() == find {
    print(-1)
} else {
    // find[i] < find[i+1]을 만족하는 가장 큰 i찾기
    var bigIdx = 0
    for i in 0..<n {
        if i+1 < n, find[i] < find[i+1] {
            bigIdx = i
        }
    }
    // bigIdx 이후 find[bigIdx]보다 큰 수 찾기
    var moreBigIdx = 0
    for j in bigIdx..<n {
        if find[bigIdx] < find[j] {
            moreBigIdx = j
        }
    }

    find.swapAt(bigIdx, moreBigIdx)
    find = find[...bigIdx] + find[(bigIdx+1)...].sorted(by: <)

    print(find.map{String($0)}.joined(separator: " "))

}
