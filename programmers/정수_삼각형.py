def solution(triangle):
    dp = [[0 for j in range(len(triangle))] for i in range(len(triangle))]
    dp[0][0] = triangle[0][0]

    for hindex, numbers in enumerate(triangle):
        for windex, number in enumerate(numbers):
            if hindex+1<len(triangle):
                dp[hindex+1][windex] = max(dp[hindex+1][windex], dp[hindex][windex] + triangle[hindex+1][windex])
                dp[hindex+1][windex+1] = max(dp[hindex+1][windex+1],dp[hindex][windex] + triangle[hindex+1][windex+1])

    
    return max(dp)