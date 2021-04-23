//
//  카펫.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/23.
//
//  카펫
//  https://programmers.co.kr/learn/courses/30/lessons/42842

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    let sum = brown + yellow
    var width = yellow, height = 1
    var next = 1
    while width*height != sum {
        if width*height > sum {
            next += 1
            while yellow%next != 0 { next += 1 }
            height = next
            width = yellow/next
        }
        width += 2
        height += 2
    }
    
    
    return [width, height]
}
