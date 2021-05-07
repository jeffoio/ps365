//
//  디스크_컨트롤러.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/07.
//
//  디스크 컨트롤러
//  https://programmers.co.kr/learn/courses/30/lessons/42627

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var jobList = jobs.sorted(by:  {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        }
        return $0[0] < $1[0]
    })
    var q = [(arrive: Int, requiredTime: Int)]()
    var curTime = 0
    var timeSpend = 0
    
    while true {
        if jobList.isEmpty , q.isEmpty { break }
        
        while !jobList.isEmpty, jobList.first![0] <= curTime {
            let job = jobList.removeFirst()
            q.append((job[0], job[1]))
        }
        
        if !q.isEmpty {
            q.sort(by: {$0.requiredTime < $1.requiredTime})
            let currentJob = q.removeFirst()
            curTime += currentJob.requiredTime
            timeSpend += (curTime - currentJob.arrive)
           
        } else {
            curTime += 1
        }
        
    }
    
    return timeSpend/jobs.count
}
