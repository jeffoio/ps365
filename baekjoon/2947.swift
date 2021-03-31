//
//  0310_boj_2947.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/10.
//
//  나무조각
//  https://www.acmicpc.net/problem/2947

var wood = readLine()!.split(separator: " ").map{ Int(String($0))! }
var startPos = 0
let target = [1,2,3,4,5]
while wood != target {
    if wood[startPos] > wood[startPos+1] {
        wood.swapAt(startPos, startPos+1)
        print(wood.map{ String($0)}.joined(separator: " "))
    }
    startPos = startPos == 3 ? 0 : startPos+1
}
