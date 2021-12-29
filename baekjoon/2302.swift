let n = Int(readLine()!)!
let m = Int(readLine()!)!
var dp = Array(repeating: 1, count: n+1)
for i in 1..<dp.count {
    if i == 1 { continue }
    dp[i] = dp[i-1] + dp[i-2]
}
var count = 0
var arr = [Int]()
for _ in 0..<m {
    var input = Int(readLine()!)! - 1
    arr.append(input-count)
    count = input+1
}
if count < n {
    arr.append(n-count)
}
print(arr.map{ dp[$0]}.reduce(1, *))
