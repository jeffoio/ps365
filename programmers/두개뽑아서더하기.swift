//
//  두개뽑아서더하기.swift
//  
//
//  Created by Jeff on 2021/04/13.
//
//  두개 뽑아서 더하기
//  https://programmers.co.kr/learn/courses/30/lessons/68644

import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var set = Set<Int>()
    
    for i in 0..<numbers.count {
        for j in i..<numbers.count {
            if i == j { continue }
            set.insert(numbers[i]+numbers[j])
        }
    }
    
    return Array(set).sorted()
}
