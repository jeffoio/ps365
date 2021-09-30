//
//  복서_정렬하기.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/09/30.
//

import Foundation

func solution(_ weights:[Int], _ head2head:[String]) -> [Int] {
    var winRate = [Double]()
    var countBeatBiggerThanYou = [Int]()

    for (player, result) in head2head.enumerated() {
        let info = Array(result).enumerated().map { (res: $0.element, isBigger: weights[player] < weights[$0.offset])}.filter { $0.res == "W" }
        let fightCount = Array(result).filter{ $0 != "N" }.count
        winRate.append(fightCount == 0 ? 0 : Double(info.count) / Double(fightCount))
        countBeatBiggerThanYou.append(info.filter{ $0.isBigger }.count)
    }
    
    return weights.indices.sorted{
        if winRate[$0] == winRate[$1] {
            if countBeatBiggerThanYou[$0] == countBeatBiggerThanYou[$1] {
                if weights[$0] == weights[$1] {
                    return $0 < $1
                } else {
                    return weights[$0] > weights[$1]
                }
            } else {
                return countBeatBiggerThanYou[$0] > countBeatBiggerThanYou[$1]
            }
        } else {
            return winRate[$0] > winRate[$1]
        }
    }.map { $0 + 1 }
}

print(solution([60, 70, 60], ["NNN", "NNN", "NNN"]))
