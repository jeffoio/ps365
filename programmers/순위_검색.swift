//
//  순위_검색.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/03.
//
//  순위 검색
//  https://programmers.co.kr/learn/courses/30/lessons/72412

import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var dic = [String: [Int]]()
    var answer = [Int]()
    
    for applicant in info {
        let information = applicant.split(separator: " ").map{String($0)}
        let language = [information[0], "-"]
        let jobGroup = [information[1], "-"]
        let career = [information[2], "-"]
        let food = [information[3], "-"]
        let score = Int(information[4])!
        
        for lan in language {
            for job in jobGroup {
                for c in career {
                    for f in food {
                        let key = "\(lan)\(job)\(c)\(f)"
                        if dic[key] == nil { dic[key] = [score] }
                        else {
                            dic[key]!.append(score)
                        }
                    }
                }
            }
        }
    }
    
    for comb in dic {
        let temp = comb.value.sorted()
        dic[comb.key] = temp
    }
   
    
    for q in query {
        var split = q.split(separator: " ").map{String($0)}.filter({$0 != "and"})
        let score = Int(split.removeLast())!
        let key = split.joined()
        
        if dic[key] == nil {
            answer.append(0)
        } else {
            var left = 0, right = dic[key]!.count - 1
            
            while left <= right {
                let mid = (left+right)/2
                if dic[key]![mid] >= score {
                    right = mid - 1
                } else {
                    left = mid + 1
                }
            }
            answer.append(dic[key]!.count - left)
        }
        
        
    }
    
    return answer
}
