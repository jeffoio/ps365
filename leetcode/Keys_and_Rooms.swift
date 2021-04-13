//
//  Keys_and_Rooms.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/13.
//
//  Keys and Rooms
//  https://leetcode.com/problems/keys-and-rooms/

class Solution {
    func canVisitAllRooms(_ rooms: [[Int]]) -> Bool {
        var visited = Array(repeating: false, count: rooms.count)
        visited[0] = true
        
        for startKey in rooms[0] {
            var q = [startKey]
            while !q.isEmpty {
                let visit = q.removeFirst()
                if visited[visit] { continue }
                visited[visit] = true
                q += rooms[visit]
            }
        }
   
        return visited.filter { $0 != true }.isEmpty
    }
}

var an = Solution()
print(an.canVisitAllRooms([[1],[2],[3],[]])) //true
print(an.canVisitAllRooms([[1,3],[3,0,1],[2],[0]]))// false

