//
//  11729.swift
//  codingtest
//
//  Created by jeff on 2021/06/28.
//
//  하노이 탑 이동 순서
//  https://www.acmicpc.net/problem/11729

var count = 0
var answer = ""
func hanoi(start: Int, dest: Int, cnt: Int) {
    count += 1
    if cnt == 0 {
        answer.append("\(start) \(dest)\n")
        return
    }
    
    hanoi(start: start, dest: 6-start-dest, cnt: cnt-1)
    answer.append("\(start) \(dest)\n")
    hanoi(start: 6-start-dest, dest: dest, cnt: cnt-1)
}

hanoi(start: 1, dest: 3, cnt: Int(readLine()!)!)
print(count)
print(answer)
