func solution(_ absolutes:[Int], _ signs:[Bool]) -> Int {
    let real = absolutes.enumerated().map { $0.element * (signs[$0.offset] ? 1 : -1) }
    
    return real.reduce(0, +)
}