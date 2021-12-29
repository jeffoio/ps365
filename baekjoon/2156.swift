let n = Int(readLine()!)!
var wine = [0]
var dp = Array(repeating: 0, count: n+1)

for _ in 0..<n {
    wine.append(Int(readLine()!)!)
}
dp[1] = wine[1]
if n >= 2{
    dp[2] = wine[1] + wine[2]
}

if n>=3 {
    for i in 3...n {
        dp[i] = max(dp[i-2] + wine[i], dp[i-3] + wine[i-1] + wine[i])
        dp[i] = max(dp[i-1], dp[i])
    }

    print(dp[n])
} else {
    print(dp[n])
}
