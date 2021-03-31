//
//  0318_boj_1946.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  신입사원
//  
let caseCount = Int(readLine()!)!
var arr = [[(Int,Int)]]()

// 입력
for _ in 0..<caseCount {
    let numbefOfcandidate = Int(readLine()!)!
    var temp = Array(repeating: (0,0), count: numbefOfcandidate+1)
    for _ in 0..<numbefOfcandidate {
        var candidate = readLine()!.split(separator: " ").map{ Int(String($0))! }
        temp[candidate[0]] = (candidate[0],candidate[1])
    }
    temp = temp.filter { $0 != (0,0)}
    arr.append(temp)
}


for candidates in arr {
    var bound = candidates[0].1
    var count = 1
    for i in 1..<candidates.count {
        if candidates[i].1 < bound { count += 1; bound = candidates[i].1}
    }
    print(count)
}
