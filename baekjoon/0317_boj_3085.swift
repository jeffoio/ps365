//
//  0317_boj_3085.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/17.
//
//  사탕 게임
//  

let N = Int(readLine()!)!
var board = [[String]]()


for _ in 0..<N {
    let input = Array(readLine()!).map{ String($0)}
    board.append(input)
}
var maxCount = checkCandy(board: board)

for i in 0..<N {
    for j in 0..<N-1 {
        var newboard = board
        
        newboard[i].swapAt(j, j+1)
        var count = checkCandy(board: newboard)
        if maxCount < count { maxCount = count}
        
        var newboard2 = board
        var temp = newboard2[j][i]
        newboard2[j][i] = newboard2[j+1][i]
        newboard2[j+1][i] = temp
        count = checkCandy(board: newboard2)
        if maxCount < count { maxCount = count}
        
        
        
    }
}

print(maxCount)

func checkCandy(board: [[String]]) -> Int {
    var max = 1
    for candys in board {
        var beforeColor = candys[0]
        var temp = 1
        for i in 1..<candys.count {
            if beforeColor == candys[i] {
                temp += 1
            }
            else {
                if max < temp { max = temp }
                temp = 1
                beforeColor = candys[i]
            }
        }
        if max < temp { max = temp }
        temp = 1
    }
   
    for i in 0..<board.count {
        let candys = board.map{ $0[i]}
        var beforeColor = candys[0]
        var temp = 1
        for i in 1..<candys.count {
            if beforeColor == candys[i] {
                temp += 1
            }
            else {
                if max < temp { max = temp }
                temp = 1
                beforeColor = candys[i]
            }
        }
        if max < temp { max = temp }
        temp = 1
    }
    
    return max
}

