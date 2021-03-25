//
//  0325_boj_4659.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/25.
//
//  비밀번호 발음하기
//  https://www.acmicpc.net/problem/4659

while true {
    var input = Array(readLine()!).map{String($0)}
    if input.joined() == "end" { break }
    
    if chkPassword(password: input) {
        print("<\(input.joined())> is acceptable.")
    } else {
        print("<\(input.joined())> is not acceptable.")
    }
    
    
}




func chkPassword(password: [String]) -> Bool {
    let vowel = ["a","e","i","o","u"]
    if password.filter { vowel.contains($0)}.isEmpty { return false }
    var isVowel = vowel.contains(password.first!)
    
    for i in 0..<password.count {
        if i+1 >= password.count { break }
        let str = password[i...i+1].map{String($0)}
        if str[0] == str[1] {
            if str.joined() == "ee" || str.joined() == "oo" { continue }
            else {
                return false
            }
        }
    }
    
    for i in 0..<password.count {
        if i+2 >= password.count { break }
        let str = password[i...i+2].map{String($0)}
        if str.filter { !vowel.contains($0) }.isEmpty { return false }
        if str.filter { !vowel.contains($0) }.count == 3 { return false }
    }
    
    return true
}

