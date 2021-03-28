//
//  0329_boj_2621.swift
//  codeingtest
//
//  Created by Jeff on 2021/03/29.
//
//  카드게임
//  https://www.acmicpc.net/problem/2621

var cards = [(color:String,value: Int)]()
var colors = [String]()
var values = [Int]()

for _ in 0..<5 {
    let read = readLine()!.split(separator: " ").map{String($0)}
    let color = read[0], value = Int(read[1])!
    cards.append((color,value))
    colors.append(color)
    values.append(value)
}
var scores = [Int]()
scores.append(straightFlush(cards: cards, color: colors, values: values))
scores.append(fourCard(cards: cards, color: colors, values: values))
scores.append(fullhouse(cards: cards, color: colors, values: values))
scores.append(straight(cards: cards, color: colors, values: values))
scores.append(triple(cards: cards, color: colors, values: values))
scores.append(pair(cards: cards, color: colors, values: values))

print(scores.max()!)




func straightFlush(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int {
    if Set(color).count != 1 {
        return 0
    }
    let values = values.sorted()
    var start = values[0], end = values[4]
    if values == Array(start...end) {
        return 900 + end
    } else {
        return 600 + end
    }
}

func fourCard(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int {
    var numbers = Array(repeating: 0, count: 10)
    
    for i in values {
        numbers[i] += 1
    }
    
    if numbers.contains(4) {
        return numbers.firstIndex(of: 4)! + 800
    } else {
        return 0
    }
    
}

func fullhouse(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int{
    var numbers = Array(repeating: 0, count: 10)
    
    for i in values {
        numbers[i] += 1
    }
    
    if numbers.contains(3), numbers.contains(2) {
        return numbers.firstIndex(of: 3)!*10 + numbers.firstIndex(of: 2)! + 700
    } else {
        return 0
    }
}

func straight(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int {
    let values = values.sorted()
    var start = values[0], end = values[4]
    if values == Array(start...end) {
        return 500 + end
    } else {
        return 0
    }
}

func triple(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int{
    var numbers = Array(repeating: 0, count: 10)
    
    for i in values {
        numbers[i] += 1
    }
    
    if numbers.contains(3) {
        return numbers.firstIndex(of: 3)!+400
    } else {
        return 0
    }
}

func pair(cards: [(color:String,value: Int)], color: [String], values: [Int]) -> Int {
    var numbers = Array(repeating: 0, count: 10)
    
    for i in values {
        numbers[i] += 1
    }
    var pairs = [Int]()
    for i in numbers.enumerated() {
        if i.element == 2 {
            pairs.append(i.offset)
        }
    }
    
    if pairs.count == 2 {
        return pairs.max()! * 10 + pairs.min()! + 300
    } else if pairs.count == 1 {
        return pairs[0] + 200
    } else {
        return values.max()! + 100
    }
}
