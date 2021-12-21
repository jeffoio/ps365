import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var count = 0
    guard words.contains(target) else { return 0 }
    
    var queue = words.filter { canChange(from: begin, to: $0) }
    
    while !queue.isEmpty {
        var newQ = [String]()
        count += 1
        
        for next in queue {
            if next == target {
                return count
            }
            newQ += words.filter { canChange(from: next, to: $0) }
        }
        queue = Array(Set(newQ))
    }
    
    return 0
}

func canChange(from: String, to: String) -> Bool {
    var count = from.count
    
    for index in 0..<count {
        if Array(from)[index] == Array(to)[index] {
            count -= 1
        }
    }
    
    return count == 1
}