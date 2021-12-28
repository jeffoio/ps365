import Foundation

let input = Int(readLine()!)!
var memo = Array(repeating: Array(repeating: 0, count: 2), count: input+1)
memo[1] = [0,1]

if input == 1{
    print(1)
} else {
    for n in 2...input  {
        memo[n][0] = memo[n-1][0] + memo[n-1][1]
        memo[n][1] = memo[n-1][0]
    }
    print(memo[input].reduce(0, +))
}