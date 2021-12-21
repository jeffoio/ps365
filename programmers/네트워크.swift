import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var graph = [Int: [Int]]()
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    for x in 0..<n {
        for y in 0..<n {
            if x == y || computers[x][y] == 0 { continue }
            
            if graph[x] == nil {
                graph[x] = [y]
            } else {
                graph[x]?.append(y)
            }
        }
    }
    
    for start in 0..<n {
        if visited[start] || graph[start] == nil { continue }
        var stack = graph[start]!
        visited[start] = true
        
        while !stack.isEmpty {
            let next = stack.removeLast()
            guard !visited[next] else { continue }
            visited[next] = true
            stack += graph[next]!
        }
        count += 1
    }
    
    return count + visited.filter({ $0 == false }).count
}