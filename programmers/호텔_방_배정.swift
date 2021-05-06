//
//  호텔_방_배정.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/06.
//

import Foundation

func findRoom(roomNumber: Int64, dic: inout [Int64: Int64], list: [Int64]) -> Int64{
    if dic[roomNumber] == nil {
        dic[roomNumber] = roomNumber+1
        
        for i in list {
            dic[i] = roomNumber + 1
        }
        print(roomNumber, list)
        return roomNumber
    }
    
    let next = findRoom(roomNumber: dic[roomNumber]!, dic: &dic, list: list + [roomNumber])
    dic[next] = next + 1
    return next
}

func solution(_ k:Int64, _ room_number:[Int64]) -> [Int64] {
    var dic = [Int64: Int64]()
    var answer = [Int64]()
    for room in room_number {
        let roomNum = findRoom(roomNumber: room, dic: &dic, list: [])
        answer.append(roomNum)
    }
    
    return answer
}
