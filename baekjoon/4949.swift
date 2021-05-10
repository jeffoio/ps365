//
//  4949.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/10.
//

import Foundation

var stack = [String]()
var m = ""

while true {
    let str = readLine(strippingNewline: true)!
    if str == "." { break }
    else {
        m.append(str)
    }
}

var k = m.components(separatedBy: ".").filter { !$0.isEmpty }
let brackes = ["(",")","[","]"]
for str in k {
    let arr = Array(str).map{String($0)}
    stack = [String]()
    for char in arr {
        if !brackes.contains(char) { continue }
        if char == "(" || char == "[" {
            stack.append(char)
            continue
        }
        if char == ")" {
            if  !stack.isEmpty && stack.last! == "("{
                stack.removeLast()
            } else {
                stack.append("a")
                
            }
        }
        if char == "]" {
            if  !stack.isEmpty && stack.last! == "["{
                stack.removeLast()
            } else {
                stack.append("a")
            }
        }
    }
    if stack.isEmpty {
        print("yes")
    } else {
        print("no")
    }
    
}


