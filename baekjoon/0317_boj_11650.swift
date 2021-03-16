//
//  0317_boj_11650.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/17.
//
//  좌표 정렬하기
//  
var count = Int(readLine()!)!
var arr = [(Int, Int)]()

for _ in 0..<count {
    let point = readLine()!.split(separator: " ").map{ Int(String($0))!}
    arr.append((point[0],point[1]))
}
arr.sort {
    if $0.0 == $1.0 { return $0.1 < $1.1 }
    else {
        return $0.0 < $1.0
    }
}
for a in arr {
    print("\(a.0) \(a.1)")
}

