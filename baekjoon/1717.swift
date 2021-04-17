//
//  1717.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/16.
//
//  집합의 표현
//  https://www.acmicpc.net/problem/1717

import Foundation

var fileio = FileIO()
let n = fileio.readInt(), m = fileio.readInt()
var input = [(command: Int, a:Int, b:Int)]()
var answer = ""
var union = UnionFindWeightedQuickUnionPathCompression<Int>()

for i in 0...n {
  union.addSetWith(i)
}

for _ in 0..<m {
   let command = fileio.readInt()
   let a = fileio.readInt(), b = fileio.readInt()
   input.append((command,a,b))
}

for tuple in input {
   let command = tuple.command
   let a = tuple.a , b = tuple.b

   if command == 0 {
       union.unionSetsContaining(a, and: b)
   } else {
       if union.inSameSet(a, and: b) {
           answer.append("yes\n")
       } else {
           answer.append("no\n")
       }
   }


}
print(answer)

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

public struct UnionFindWeightedQuickUnionPathCompression<T: Hashable> {
  private var index = [T: Int]()
  private var parent = [Int]()
  private var size = [Int]()

  public init() {}

  public mutating func addSetWith(_ element: T) {
    index[element] = parent.count
    parent.append(parent.count)
    size.append(1)
  }

  /// Path Compression.
  private mutating func setByIndex(_ index: Int) -> Int {
    if index != parent[index] {
      parent[index] = setByIndex(parent[index])
    }
    return parent[index]
  }

  public mutating func setOf(_ element: T) -> Int? {
    if let indexOfElement = index[element] {
      return setByIndex(indexOfElement)
    } else {
      return nil
    }
  }

  public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
    if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
      if firstSet != secondSet {
        if size[firstSet] < size[secondSet] {
          parent[firstSet] = secondSet
          size[secondSet] += size[firstSet]
        } else {
          parent[secondSet] = firstSet
          size[firstSet] += size[secondSet]
        }
      }
    }
  }

  public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
    if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
      return firstSet == secondSet
    } else {
      return false
    }
  }
}
