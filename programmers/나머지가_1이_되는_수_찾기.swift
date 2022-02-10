func solution(_ n:Int) -> Int {
    var divider = 1
    while true {
        if n % divider == 1 {
            return divider
        }
        divider += 1
    }
    return 0
}