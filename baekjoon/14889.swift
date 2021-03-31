//
//  0330_boj_14889.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/30.
//
//  스타트와 링크
//  https://www.acmicpc.net/problem/14889

let n = Int(readLine()!)!
var players = Array(0..<n)
var possibleComb = [[Int]]()
var board = [[Int]]()
var diff = Int.max

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    board.append(input)
}

combination(of: players, selectedCount: n/2, current: 0, seletcted: [], storage: &possibleComb)

for i in 0..<(possibleComb.count/2) {
    let startTeam = possibleComb[i]
    let linkTeam = players.filter { !startTeam.contains($0)}
    var temp = [[Int]]()
    var temp2 = [[Int]]()
    combination(of: startTeam, selectedCount: 2, current: 0, seletcted: [], storage: &temp)
    combination(of: linkTeam, selectedCount: 2, current: 0, seletcted: [], storage: &temp2)
    var sum = 0
    var sum2 = 0
    
    for idx in 0..<temp.count {
        sum += board[temp[idx][0]][temp[idx][1]]
        sum += board[temp[idx][1]][temp[idx][0]]
        
        sum2 += board[temp2[idx][0]][temp2[idx][1]]
        sum2 += board[temp2[idx][1]][temp2[idx][0]]
    }
    
    if diff > abs(sum-sum2) {
        diff = abs(sum-sum2)
    }

}

print(diff)

func combination(of total: [Int], selectedCount: Int,current idx: Int, seletcted: [Int], storage: inout [[Int]]) {
    if selectedCount == 0 { storage.append(seletcted) }
    else if idx == total.count { return }
    else {
        let new = seletcted + [total[idx]]
        combination(of: total, selectedCount: selectedCount-1, current: idx+1, seletcted: new, storage: &storage)
        combination(of: total, selectedCount: selectedCount, current: idx+1, seletcted: seletcted, storage: &storage)
    }
}


