import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let numberOfRemoved = lottos.filter({ $0 == 0}).count
    let matchedCount = lottos.filter { win_nums.contains($0)}.count
    
    return [order(matchedCount+numberOfRemoved), order(matchedCount)]
}

func order(_ matched: Int) -> Int {
    switch matched {
    case 2:
        return 5
    case 3:
        return 4
    case 4:
        return 3
    case 5:
        return 2
    case 6:
        return 1
    default:
        return 6
    }
}