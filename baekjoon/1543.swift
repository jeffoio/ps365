//
//  0318_boj_1543.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  문서 검색
//  
let documents = Array(readLine()!).map{ String($0)}
let word = readLine()!
var max = 0

for start in 0..<documents.count - word.count {
    var count = 0
    var startIdx = start
   // if max > (documents.count - start)/word.count { continue }
    while (word.count + startIdx) <= documents.count {
        let find = documents[startIdx..<(word.count + startIdx)].joined()
        print(find)
        if word == find {
            count += 1
            startIdx += word.count
        } else {
            startIdx += 1
        }
    }
    if max < count { max = count}
}

print(max)
