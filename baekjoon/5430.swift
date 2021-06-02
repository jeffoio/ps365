//
//  5430.swift
//  codingtest
//
//  Created by TakHyun Jung on 2021/06/02.
//
//  AC
//  https://www.acmicpc.net/problem/5430

import Foundation

// 출처 https://github.com/raywenderlich/swift-algorithm-club
public struct Deque<T> {
  var array: [T?]
  private var head: Int
  private var capacity: Int
  private let originalCapacity: Int

  public init(_ capacity: Int = 10) {
    self.capacity = max(capacity, 1)
    originalCapacity = self.capacity
    array = [T?](repeating: nil, count: capacity)
    head = capacity
  }

  public var isEmpty: Bool {
    return count == 0
  }

  public var count: Int {
    return array.count - head
  }

  public mutating func enqueue(_ element: T) {
    array.append(element)
  }

  public mutating func enqueueFront(_ element: T) {
    if head == 0 {
      capacity *= 2
      let emptySpace = [T?](repeating: nil, count: capacity)
      array.insert(contentsOf: emptySpace, at: 0)
      head = capacity
    }

    head -= 1
    array[head] = element
  }

  public mutating func dequeue() -> T? {
    guard head < array.count, let element = array[head] else { return nil }

    array[head] = nil
    head += 1

    if capacity >= originalCapacity && head >= capacity*2 {
      let amountToRemove = capacity + capacity/2
      array.removeFirst(amountToRemove)
      head -= amountToRemove
      capacity /= 2
    }
    return element
  }

  public mutating func dequeueBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.removeLast()
    }
  }

  public func peekFront() -> T? {
    if isEmpty {
      return nil
    } else {
      return array[head]
    }
  }

  public func peekBack() -> T? {
    if isEmpty {
      return nil
    } else {
      return array.last!
    }
  }
}

let test = Int(readLine()!)!
var answer = ""
for _ in 0..<test {
    let order = readLine()!
    let numberOfarr = Int(readLine()!)!
    var arr = readLine()!.components(separatedBy: ["[",",","]"," "]).filter({$0 != ""})
    var dq = Deque<String>()
    for i in arr {
        dq.enqueue(i)
    }
    var reversed = false
    var isError = false
    for o in order {
        if o == "R" {
            reversed.toggle()
            continue
        }
        if reversed {
            isError = dq.dequeueBack() == nil
        } else {
            isError = dq.dequeue() == nil
        }
        if isError { break }
    }
    arr = dq.array.compactMap({$0})
    if isError {
        answer += "error\n"
    } else {
        if reversed { arr = arr.reversed()}
        let newStr = "[" + arr.joined(separator: ",") + "]\n"
        answer.append(newStr)
    }
}
print(answer)
