//
//  0308_boj_2941.swift
//  
//
//  Created by Jeff on 2021/03/08.
//
//  크로아티아 알파벳
//  https://www.acmicpc.net/problem/2941

import Foundation

var word = readLine()!
let changeSet = ["c=", "c-", "dz=", "d-", "d-", "lj", "nj", "s=", "z="]

for replace in changeSet {
    word = word.replacingOccurrences(of: replace, with: "0")
}

print(word.count)
