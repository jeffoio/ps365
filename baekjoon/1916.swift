//
//  1916.swift
//  codeingtest
//
//  Created by Jeff on 2021/05/04.
//
//  최소비용 구하기
//  https://www.acmicpc.net/problem/1916

let n = Int(readLine()!)!, m = Int(readLine()!)!
var board = Array(repeating: [(to: Int, charge: Int)](), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    let from = input[0] - 1, to = input[1] - 1, charge = input[2]
    board[from].append((to,charge))
}

let find = readLine()!.split(separator: " ").map{Int(String($0))!-1}
let dist = dijkstra(start: find[0], board: board)
print(dist[find[1]])

struct Heap<T> {
    var list = [T]()
    private var orderCriteria: (T,T) -> Bool
    public var count: Int {
        return list.count
    }
    
    init(order: @escaping (T,T) -> Bool) {
        self.orderCriteria = order
    }
    
    func isEmpty() -> Bool {
        return list.isEmpty
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
    
    private mutating func insert(_ value: T) {
        var curIdx = list.count
        list.append(value)
        
        while curIdx > 0, orderCriteria( list[(curIdx-1)/2], list[curIdx]) {
            list.swapAt((curIdx-1)/2, curIdx)
            curIdx = (curIdx-1)/2
        }
    }
    
    private mutating func remove() -> T? {
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

func dijkstra(start: Int, board: [[(to:Int, charge: Int)]]) -> [Int] {
    var minDistance = Array(repeating: Int.max, count: board.count)
    var pq = Heap<(from: Int, weight: Int)>(order: { $0.weight < $1.weight })
    pq.enqueue(element: (start, 0))
    minDistance[start] = 0

    while !pq.isEmpty() {
        let current = pq.peek()!.from
        let distance = -pq.peek()!.weight
        _ = pq.dequeue()
        if minDistance[current] < distance { continue }

        for i in 0..<board[current].count {
            let to = board[current][i].to
            let nextDistance = board[current][i].charge + distance
            if nextDistance < minDistance[to] {
                minDistance[to] = nextDistance
                pq.enqueue(element: (to, -nextDistance))
            }

        }
    }

    return minDistance
}
