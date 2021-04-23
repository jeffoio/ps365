//
//  보석_쇼핑.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/23.
//
//  [카카오 인턴] 보석 쇼핑
//  https://programmers.co.kr/learn/courses/30/lessons/67258

import Foundation

func solution(_ gems:[String]) -> [Int] {
    let nessaryGem = Set(gems)
    var gemMap = [String: Int]()
    var left = 0, right = -1
    var answer = [0,gems.count-1]
    
    while left < gems.count, right < gems.count {
        if nessaryGem.count == gemMap.count {
            if answer[1]-answer[0] > right - left {
                answer = [left, right]
            }
            gemMap[gems[left]]! -= 1
            if gemMap[gems[left]] == 0 {
                gemMap[gems[left]] = nil
            }
            
            left += 1
        } else {
            
            if right+1 < gems.count {
                right += 1
                gemMap[gems[right], default: 0] += 1
            }else {
                break
            }
        }
        
        
    }
    
    return answer.map{$0+1}
}
