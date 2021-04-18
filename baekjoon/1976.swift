//
//  1976.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/18.
//
//  여행 가자
//  https://www.acmicpc.net/problem/1976

let n = Int(readLine()!)!, m = Int(readLine()!)!
var unionFind = UnionFind()

for i in 1...n {
    unionFind.add(i)
}

for i in 1...n {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    for j in 1...input.count {
        if input[j-1] == 1 {
            unionFind.union(i, and: j)
        }
    }
}

var wantToGo = readLine()!.split(separator: " ").map{Int(String($0))!}
wantToGo = wantToGo.map{ unionFind.find($0)! }

if Set(wantToGo).count == 1 {
    print("YES")
} else {
    print("NO")
}


struct UnionFind {
    var indice: [Int: Int]
    var parent: [Int]
    
    init() {
        self.indice = [Int: Int]()
        self.parent = [Int]()
    }
    
    mutating func add(_ element: Int) {
        indice[element] = parent.count
        parent.append(element)
    }
    
    mutating func find(_ element: Int) -> Int? {
        guard let index = indice[element] else { return nil }
        if element == parent[index] {
            return element
        }
        guard let root = find(parent[index]) else { return nil }
        parent[index] = root
        
        return root
    }
    
    mutating func union(_ firstElement: Int, and secondElement: Int) {
        guard let firstRoot = find(firstElement), let secondRoot = find(secondElement) else {
            return
        }
        if firstRoot < secondRoot {
            if let index = indice[secondRoot] {
                parent[index] = firstRoot
            }
        } else {
            if let index = indice[firstRoot] {
                parent[index] = secondRoot
            }
        }
    }
    
}

