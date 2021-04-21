//
//  1535.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/21.
//
//  안녕
//  https://www.acmicpc.net/problem/1535

//  n명의 사람이 있을때 각각의 사람에게 인사를 할지 말지 결정
//  사람당 인사 or no인사 몇명과 인사를 하는지는 중요하지 않음
//  가능한 방법은 2^N (n<=20) 으로 완전탐색으로 풀이

let n = Int(readLine()!)!
var maxHappy = 0
let losthealth = readLine()!.split(separator: " ").map{Int(String($0))!}
let happy = readLine()!.split(separator: " ").map{Int(String($0))!}

func f(count: Int, curHealth: Int, curHappy: Int) {
    if curHealth <= 0 {
        return
    }
    if count == n {
        maxHappy = max(maxHappy, curHappy)
        return
    }
    
    f(count: count+1, curHealth: curHealth-losthealth[count], curHappy: curHappy+happy[count])
    f(count: count+1, curHealth: curHealth, curHappy: curHappy)
}

f(count: 0, curHealth: 100, curHappy: 0)
print(maxHappy)
