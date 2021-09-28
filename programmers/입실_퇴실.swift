//
//  입실_퇴실.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/09/29.
//

import Foundation

func solution(_ enter:[Int], _ leave:[Int]) -> [Int] {
    var result = Array(repeating: [Int](), count: enter.count)
    var enter = enter.map{ Int($0)-1 }, leave = leave.map{Int($0)-1}
    var enterPerson = enter.removeFirst()
    var leavePerson = leave.removeFirst()
    var room = [Int]()
    
    while !leave.isEmpty {
        if !room.contains(leavePerson) { //방에 나가야할 사람이 없으면 들어가야할 사람 들어감
            room.append(enterPerson)
            if !enter.isEmpty {
                enterPerson = enter.removeFirst()
            }
        } else {  // 사람 나가고 방안에 있는사람 모두 서로 만남
            room = room.filter { $0 != leavePerson }
            result[leavePerson].append(contentsOf: room) // 나간사람에 현재 방에있는 사람들 넣기
            room.forEach { result[$0].append(leavePerson) } // 현재방에 있는사람한테 나간사람 넣기
            leavePerson = leave.removeFirst()
        }
    }
    return result.enumerated().map{
        if $0.element.contains($0.offset) {
            return Set($0.element).count - 1
        }
        return Set($0.element).count
    }
}
