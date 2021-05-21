//
//  15688.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/21.
//
//  수 정렬하기 5
//  https://www.acmicpc.net/problem/15688

import Foundation

// 출처 https://gist.github.com/JCSooHwanCho/30be4b669321e7a135b84a1e9b075f88
final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10 || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10 && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

var fileio = FileIO()

var n = fileio.readInt()
var numbers = [Int]()

for _ in 0..<n {
    numbers.append(fileio.readInt())
}
var ans = ""
numbers.sort(by: <)
for num in numbers {
    ans.append("\(num)\n")
}
print(ans)
