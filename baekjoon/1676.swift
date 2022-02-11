var num = Int(readLine()!)!

func solution(_ n:Int) -> Int{
    var answer = 0
    var square = 5

    while square <= n {
        answer += (n/square)
        square *= 5
    }

    return answer
}

print(solution(num))