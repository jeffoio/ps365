import Foundation

let input = Int(readLine()!)!
var dp = Array(repeating: 1, count: 10)
dp[0] = 0
var n = 1
while n != input {
    var temp = Array(repeating: 0, count: 10)
    for i in 1...8 {
        temp[i-1] += dp[i]
        temp[i+1] += dp[i]
    }
    temp[1] += dp[0]
    temp[8] += dp[9]
    dp = temp.map { $0  % 1000000000}
    n+=1
}

print(dp.reduce(0, +) % 1000000000)