//
//  12813.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/13.
//
//  이진수 연산
//  https://www.acmicpc.net/problem/12813

var a = Array(readLine()!).map{String($0)}
var b = Array(readLine()!).map{String($0)}

var res = ""
for i in 0..<a.count {
    if a[i] == "1", b[i] == "1" {
        res.append("1")
    } else {
        res.append("0")
    }
}

print(res)
res = ""
for i in 0..<a.count {
    if a[i] == "1" || b[i] == "1"{
        res.append("1")
    } else {
        res.append("0")
    }
}
print(res)
res = ""

for i in 0..<a.count {
    if a[i] != b[i] {
        res.append("1")
    } else {
        res.append("0")
    }
}
print(res)
res = ""
var res2 = ""
for i in 0..<a.count {
    if a[i] == "1" {
        res.append("0")
    } else {
        res.append("1")
    }
    
    if b[i] == "1" {
        res2.append("0")
    } else {
        res2.append("1")
    }
}
print(res)
print(res2)
