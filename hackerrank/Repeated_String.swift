//
//  Repeated_String.swift
//
//
//  Created by jeff on 2021/07/01.
//

import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    // Write your code here
    var numberOfa = 0
    for char in s {
        if char == "a" { numberOfa += 1}
    }

    numberOfa *= (n/s.count)
    let newStr = Array(s).map{String($0)}[0..<n%s.count]
    for char in newStr {
        if char == "a" { numberOfa += 1}
    }
    return numberOfa
}
