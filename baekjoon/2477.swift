//
//  2477.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/10.
//
//  참외밭
//  https://www.acmicpc.net/problem/2477

let k = Int(readLine()!)!
var num = Array(repeating: [Int](), count: 7)
var area = 0, idx = 0
var check = [[Int]]()

for _ in 0..<6 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    num[input[0]].append(input[1])
    check.append(input)
}

if num[3].count == 2 , num[1].count == 2 {
    area = num[2].first! * num[4].first!
    for i in check {
        if i[0] == 2 {
            break
        }
        idx += 1
    }
    idx = (idx+2)%6
    let emptySquare = check[idx][1] * check[(idx+1)%6][1]
    area -= emptySquare
    
} else if num[2].count == 2, num[4].count == 2 {
    area = num[1].first! * num[3].first!
    for i in check {
        if i[0] == 1 {
            break
        }
        idx += 1
    }
    idx = (idx+2)%6
    let emptySquare = check[idx][1] * check[(idx+1)%6][1]
    area -= emptySquare
} else if num[1].count == 2, num[4].count == 2 {
    area = num[2].first! * num[3].first!
    for i in check {
        if i[0] == 3 {
            break
        }
        idx += 1
    }
    idx = (idx+2)%6
    let emptySquare = check[idx][1] * check[(idx+1)%6][1]
    area -= emptySquare
} else if num[2].count == 2, num[3].count == 2 {
    area = num[1].first! * num[4].first!
    for i in check {
        if i[0] == 4 {
            break
        }
        idx += 1
    }
    idx = (idx+2)%6
    let emptySquare = check[idx][1] * check[(idx+1)%6][1]
    area -= emptySquare
}

print(area*k)
