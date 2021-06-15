//
//  9466.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/15.
//

//  텀 프로젝트
//  https://www.acmicpc.net/problem/9466

let test = Int(readLine()!)!
var answer = ""
for _ in 0..<test {
    let n = Int(readLine()!)!
    let choosedList = readLine()!.split(separator: " ").map{Int(String($0))! - 1 }
    var visited = Array(repeating: false, count: n)
    var hasTeam = [Int]()

    loop: for student in 0..<n {
        if visited[student] { continue }
        visited[student] = true
        var q = [student]
        var teammateList = [student]
        
        while !q.isEmpty {
            let choosingStudent = q.removeLast()
            let choosedStudent = choosedList[choosingStudent]
            
            if visited[choosedStudent]  {
                if choosingStudent == choosedStudent {
                    hasTeam.append(choosedStudent)
                } else {
                    if teammateList.contains(choosedStudent) {
                        let startCycle = teammateList.firstIndex(of: choosedStudent)!
                        hasTeam += teammateList[startCycle...]
                        teammateList = []
                    }
                }
                
                continue loop
            }
            visited[choosedStudent] = true
            teammateList.append(choosedStudent)
            q.append(choosedStudent)
            
        }
    }

    answer.append("\(n-hasTeam.count)\n")
}
print(answer)
