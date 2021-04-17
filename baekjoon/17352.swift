//
//  17352.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/17.
//
//  여러분의 다리가 되어 드리겠습니다!
//  https://www.acmicpc.net/problem/17352

let n = Int(readLine()!)!
var temp = [Int]()
var union = UnionFindWeightedQuickUnionPathCompression<Int>()

for i in 1...n {
    union.addSetWith(i)
}

for _ in 0..<n-2 {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    union.unionSetsContaining(input[0], and: input[1])
}

for i in 1...n {
    temp.append(union.setOf(i)!)
}

temp = Array(Set(temp))
print("\(temp[0]+1) \(temp[1]+1)")

public struct UnionFindWeightedQuickUnionPathCompression<T: Hashable> {
   var index = [T: Int]()
    var parent = [Int]()
   var size = [Int]()

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

