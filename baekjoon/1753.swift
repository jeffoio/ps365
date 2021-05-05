//
//  1753.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/05.
//
//  최단경로
//  https://www.acmicpc.net/problem/1753

import Foundation

var fileio = FileIO()
let v = fileio.readInt()
let e = fileio.readInt()
let start = fileio.readInt() - 1
var graph = Array(repeating: [(to: Int,weight: Int)](), count: v)

for _ in 0..<e {
    let u = fileio.readInt() - 1
    let v = fileio.readInt() - 1
    let w = fileio.readInt()
    graph[u].append((v, w))
}

var minDist = Array(repeating: Int.max, count: v)
minDist[start] = 0

var pq: Heap = Heap<Edge>(order: >)
pq.insert(Edge(node: start, weight: 0))

while !pq.isEmpty {
    let cur = pq.remove()!
    
    if minDist[cur.node] < cur.weight {
        continue
    }
    
    for v in graph[cur.node] {
        let next = v.to
        let nextDistance = cur.weight + v.weight
                
        if minDist[next] > nextDistance {
            minDist[next] = nextDistance
            pq.insert(Edge(node: next, weight: nextDistance))
        }
    }
}

var answer = ""
for i in minDist {
    if i == Int.max {
        answer.append("INF\n")
    } else {
        answer.append("\(i)\n")
    }
}
print(answer)

struct Heap<T> {
    private var list = [T]()
    private var orderCriteria: (T,T) -> Bool
    public var count: Int {
        return list.count
    }
    public var isEmpty: Bool {
        return list.isEmpty
    }
    
    init(order: @escaping (T,T) -> Bool) {
        self.orderCriteria = order
    }
    
    func peek() -> T? {
        return list.isEmpty ? nil : list[0]
    }
    
    mutating func enqueue(element: T) {
        insert(element)
    }
    
    mutating func dequeue() -> T? {
        return remove()
    }
    
    mutating func insert(_ value: T) {
        var curIdx = list.count
        list.append(value)
        
        while curIdx > 0, orderCriteria( list[(curIdx-1)/2], list[curIdx]) {
            list.swapAt((curIdx-1)/2, curIdx)
            curIdx = (curIdx-1)/2
        }
    }
    
    mutating func remove() -> T? {
        guard !list.isEmpty else { return nil }
        if list.count == 1 {
            return list.removeLast()
        }
        
        let value = list[0]
        list[0] = list.removeLast()
        shiftDown(0)
        
        return value
    }
    
    private mutating func shiftDown(from index: Int, until endIndex: Int) {
        let leftChildIndex = 2*index + 1
        let rightChildIndex = 2*index + 2
        var first = index
        
        if leftChildIndex < endIndex, orderCriteria(list[first], list[leftChildIndex]){
            first = leftChildIndex
        }
        if rightChildIndex < endIndex, orderCriteria(list[first],list[rightChildIndex] ) {
            first = rightChildIndex
        }
        if first == index { return }
        
        list.swapAt(index, first)
        shiftDown(from: first, until: endIndex)
    }
    
    private mutating func shiftDown(_ index: Int) {
        shiftDown(from: index, until: list.count)
    }
    
}

struct Edge : Comparable{
    var node : Int
    var weight : Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        lhs.weight < rhs.weight
    }
}

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
