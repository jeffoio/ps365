
func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(sum: Int, pos: Int) {
        if pos == numbers.count {
            if sum == target {
                count += 1
            }
            return
        }
        
        dfs(sum: sum + numbers[pos], pos: pos+1)
        dfs(sum: sum - numbers[pos], pos: pos+1)
    }
    
    dfs(sum: 0, pos: 0)
    return count
}

print(solution([1,1,1,1,1], 3))

