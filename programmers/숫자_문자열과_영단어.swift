//
//  숫자_문자열과_영단어.swift
//  codingtest
//
//  Created by jeff on 2021/07/09.
//
//  숫자 문자열과 영단어
//  https://programmers.co.kr/learn/courses/30/lessons/81301

import Foundation

func solution(_ s:String) -> Int {
    let dic = [
        "zero": "0", "one": "1", "two": "2", "three": "3", "four": "4", "five": "5",
        "six": "6", "seven": "7", "eight": "8", "nine": "9"
    ]
    var s = s
    for i in dic {
        s =  s.replacingOccurrences(of: i.key, with: i.value)
    }
    
    return Int(s)!
}
