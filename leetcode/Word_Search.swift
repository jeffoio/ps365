//
//  Word_Search.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/13.
//
//  79. Word Search
//  https://leetcode.com/problems/word-search/

class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let word = Array(word).map{Character(String($0))}
        let m = board.count, n = board[0].count
        let dx = [-1,0,1,0], dy = [0,1,0,-1]
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)
        var end = false
                
        func backtracking(y:Int, x:Int, pos: Int) {
            if board[y][x] != word[pos] { return }
            if pos == word.count-1 {
                end = true
                return
            }
            
            for idx in 0..<4 {
                let next = (y: y+dy[idx], x: x+dx[idx], pos: pos+1)
                guard next.x >= 0, next.y >= 0, next.x < n, next.y < m,
                      !visited[next.y][next.x],
                      board[next.y][next.x] == word[next.pos]
                else { continue }
                
                visited[next.y][next.x] = true
                backtracking(y: next.y, x: next.x, pos: next.pos)
                visited[next.y][next.x] = false
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] != word[0] { continue }
                visited = Array(repeating: Array(repeating: false, count: n), count: m)
                visited[i][j] = true
                backtracking(y: i, x: j, pos: 0)
            }
        }
        
        return end
    }
}

var an = Solution()
print(an.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCCED")) //true
print(an.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "SEE")) // true
print(an.exist([["A","B","C","E"],["S","F","C","S"],["A","D","E","E"]], "ABCB")) //false
print(an.exist([["a"]], "a")) //true
print(an.exist([["A","B","C","E"],["S","F","E","S"],["A","D","E","E"]], "ABCESEEEFS")) // true
