//
//  0324_boj_2979.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/24.
//
//  트럭 주차
//  https://www.acmicpc.net/problem/2979

let cost = readLine()!.split(separator: " ").map{ Int(String($0))!}
var time = [(start: Int,end: Int)]()

var end = 0
for _ in 0..<3 {
    let input = readLine()!.split(separator:" ").map{Int(String($0))!}
    time.append((input[0],input[1]))
    if end < input[1] { end = input[1] }
}

var sum = 0
for i in 1...end {
    var howManyCar = 0
    if time[0].start < i , i<=time[0].end { howManyCar += 1 }
    if time[1].start < i , i<=time[1].end { howManyCar += 1 }
    if time[2].start < i , i<=time[2].end { howManyCar += 1 }
    if howManyCar == 1 { sum += (cost[0])}
    if howManyCar == 2 { sum += (cost[1]*2)}
    if howManyCar == 3 { sum += (cost[2]*3)}

}

print(sum)
