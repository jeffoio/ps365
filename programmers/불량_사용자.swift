//
//  불량_사용자.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/23.
//
//  [카카오 인턴] 불량 사용자
//  https://programmers.co.kr/learn/courses/30/lessons/64064

import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var possible = [[String]]()
    
    for ban in banned_id {
        let ban = Array(ban).map{String($0)}
        var target = [String]()
        
        for id in user_id {
            let id = Array(id).map{String($0)}
            var check = true
            if ban.count != id.count { continue }
            
            for idx in 0..<id.count {
                if ban[idx] == "*" { continue }
                if ban[idx] != id[idx] {
                    check = false
                    break
                }
            }
            
            if check {
                target.append(id.joined())
            }
        }
        possible.append(target)
    }
    var res = [Set<String>]()
    
    func dfs(pickCnt: Int,picked: Set<String>) {
        if pickCnt > banned_id.count { return }
        if pickCnt == banned_id.count {
            if !res.contains(picked) {
                res.append(picked)
            }
            return
        }
        var picked = picked
        for i in possible[pickCnt] {
            if !picked.contains(i) {
                picked.insert(i)
                dfs(pickCnt: pickCnt+1, picked: picked)
                picked.remove(i)
            }
        }
        
    }
    dfs(pickCnt: 0, picked: Set<String>())
    
    return res.count
}
