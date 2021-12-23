def solution(m, n, puddles):
    memo = [[0 for x in range(m)] for y in range(n)]
    puddles = [[q,p] for [p,q] in puddles] 
    for puddle in puddles:
        if puddle:
            memo[puddle[0]-1][puddle[1]-1] = -1
    
    memo[0][0] = 1

    def dp(x,y):
        if x < 0 or y < 0:
            return 0
        if memo[x][y] == -1:
            return 0
        if memo[x][y] > 0:
            return memo[x][y]
        
        memo[x][y] = dp(x-1, y) + dp(x, y-1)

        return memo[x][y] % 1000000007
    return dp(n-1,m-1)