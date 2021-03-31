//
//  0318_boj_14490.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/18.
//
//  백대열
//  
var input = readLine()!.split(separator: ":").map{ Int(String($0))!}
var g = gcd(a: input[0],b: input[1])

print("\(input[0]/g):\(input[1]/g)")


func gcd(a: Int, b:Int) -> Int {
    if b == 0 { return a}
    else {
        return gcd(a: b, b: a%b)
    }
}
