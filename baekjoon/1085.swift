//
//  0324_boj_1085.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/24.
//
//  직사각형에서 탈출
//  https://www.acmicpc.net/problem/1085

var input = readLine()!.split(separator: " ").map{Int(String($0))!}
var x = input[0], y = input[1] , w = input[2] , h = input[3]


let xmin = min(x-0, w-x)
let ymin = min(y-0, h-y)
print(min(xmin, ymin))
