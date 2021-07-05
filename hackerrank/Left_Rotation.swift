//
//  Left_Rotation.swift
//  codingtest
//
//  Created by jeff on 2021/07/05.
//

//  Left Rotation
//  https://www.hackerrank.com/challenges/three-month-preparation-kit-array-left-rotation/problem?h_r=internal-search

func rotLeft(a: [Int], d: Int) -> [Int] {
    // Write your code here
    return a[d...].map{Int($0)} + a[..<d].map{Int($0)}
}
