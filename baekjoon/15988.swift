let testCase = Int(readLine()!)!
var dp = Array(repeating: 0, count: 1000001)
var answer = [Int]()
dp[1] = 1
dp[2] = 2
dp[3] = 4

for i in 4...1000000 {
    dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % 1000000009
}

for _ in 0..<testCase {
    let n = Int(readLine()!)!
    answer.append(dp[n])
}
answer.forEach { n in
    print(n)
}