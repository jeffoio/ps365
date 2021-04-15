//
//  키패드_누르기.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/15.
//
//  키패드 누르기
//  https://programmers.co.kr/learn/courses/30/lessons/67256

import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let keyPad = [[1,2,3],[4,5,6],[7,8,9],[10,0,11]]
    var keyPadPos = [Int:(x:Int,y:Int)]()
    var answer = ""
    
    for i in 0..<3 {
        for j in 0..<4 {
            let key = keyPad[j][i]
            keyPadPos[key] = (j,i)
        }
    }
    var leftCur = keyPadPos[10]!, rightCur = keyPadPos[11]!
    
    for i in numbers {
        let wantPos = keyPadPos[i]!
        switch i {
        case 1,4,7:
            leftCur = wantPos
            answer.append("L")
        case 3,6,9:
            rightCur = wantPos
            answer.append("R")
        default:
            let leftDiff = abs(leftCur.0 - wantPos.0) + abs(leftCur.1-wantPos.1)
            let rightDiff = abs(rightCur.0 - wantPos.0) + abs(rightCur.1-wantPos.1)
            if leftDiff == rightDiff {
                answer.append(hand=="left" ? "L" : "R")
                leftCur = hand=="left" ? wantPos : leftCur
                rightCur = hand=="right" ? wantPos : rightCur
            } else {
                answer.append(leftDiff<rightDiff ? "L" : "R")
                leftCur = leftDiff<rightDiff ? wantPos : leftCur
                rightCur = rightDiff < leftDiff ? wantPos : rightCur
            }
           print(i,leftDiff,rightDiff)
        }
    }
    
    return answer
}
