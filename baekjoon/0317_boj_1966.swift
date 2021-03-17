//
//  0317_boj_1966.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/17.
//
//  프린터 큐
//  

let testCount = Int(readLine()!)!

for _ in 0..<testCount {
    var input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let target = input[1]
    var priority = readLine()!.split(separator: " ").map{ Int(String($0))! }
    
    var que = priority.enumerated().map { ($0.offset,$0.element) }
    
    var done = 1
    while true {
        let turn = que.removeFirst()
        if que.filter({ $0.1 > turn.1}).isEmpty{
            if turn.0 == target {
                print(done)
                break
            } else {
                done += 1
            }
            
        } else {
            que.append(turn)
        }

    }
}

