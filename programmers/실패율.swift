import Foundation

func solution(_ N:Int, _ stages:[Int]) -> [Int] {
    var prob = [(stage: Int, p: Double)]()
    var stages = stages.sorted(by: >)
    var numberOfplayer = stages.count
    
    for stage in 1...N {
        var count = 0
        
        while !stages.isEmpty, stages.last! == stage {
            stages.removeLast()
            count += 1
        }
        
        prob.append((stage, Double(count) / Double(numberOfplayer)))
        numberOfplayer -= count
    }
    
    prob.sort { s1, s2 in
        if s1.p == s2.p {
            return s1.stage < s2.stage
        }
        return s1.p > s2.p
    }
    
    return prob.map{ $0.stage }
}