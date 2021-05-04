//
//  메뉴_리뉴얼.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/04.
//
//  메뉴 리뉴얼
//  https://programmers.co.kr/learn/courses/30/lessons/72411

import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var answer = [String]()
    
    for courseCount in course {
        var storage = [String](), maxCourse = [String]()
        var max = 0
        for order in orders {
            let array = Array(order).map{String($0)}
            combination(of: array.sorted(), selectedCount: courseCount, current: 0, seletcted: [], storage: &storage)
        }
        storage.sort()
        
        for comb in Set(storage) {
            let cnt = storage.filter({$0 == comb}).count
            if max == cnt {
                maxCourse.append(comb)
            } else if max < cnt {
                max = cnt
                maxCourse = [comb]
            }
        }
        if max < 2 { continue }
        answer += maxCourse
    }

    return answer.sorted()
}

func combination(of total: [String], selectedCount: Int,current idx: Int, seletcted: [String], storage: inout [String]) {
    if selectedCount == 0 {
        storage.append(seletcted.joined())
    }
    else if idx == total.count { return }
    else {
        let new = seletcted + [total[idx]]
        combination(of: total, selectedCount: selectedCount-1, current: idx+1, seletcted: new, storage: &storage)
        combination(of: total, selectedCount: selectedCount, current: idx+1, seletcted: seletcted, storage: &storage)
    }
}
