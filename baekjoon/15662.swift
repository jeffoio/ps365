//
//  15662.swift
//  codeingtest
//
//  Created by Jeff on 2021/04/26.
//
//  톱니바퀴 (2)
//  https://www.acmicpc.net/problem/15662

let n = Int(readLine()!)!
var wheels = [[String]]()

for _ in 0..<n {
    let input = Array(readLine()!).map{String($0)}
    wheels.append(input)
}

let k = Int(readLine()!)!
var count = 0
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map{Int(String($0))!}
    var startPos = input[0]-1, direction = input[1]
    var changedWheel = wheels
    var sp = startPos ,spDirection = direction
    
    while sp >= 1 , spDirection != 3{
        var beforeWheel = wheels[sp-1]
        var curWheel = wheels[sp]
        
        if beforeWheel[2] != curWheel[6] {
            beforeWheel = move(wheel: beforeWheel, direction: spDirection * -1)
            spDirection *= -1
            changedWheel[sp-1] = beforeWheel
        } else {
            spDirection = 3
        }
        sp -= 1
    }
    
    while startPos < wheels.count, direction != 3 {
        var startWheel = wheels[startPos]
        
        if startPos+1 >= wheels.count {
            startWheel = move(wheel: startWheel, direction: direction)
            direction = 3
        } else {
            var nextWheel = wheels[startPos+1]
            
            if startWheel[2] != nextWheel[6] {
                startWheel = move(wheel: startWheel, direction: direction)
                nextWheel = move(wheel: nextWheel, direction: direction * -1)
                direction *= -1
            } else {
                startWheel = move(wheel: startWheel, direction: direction)
                direction = 3
            }
            changedWheel[startPos+1] = nextWheel
        }
        
        changedWheel[startPos] = startWheel
        startPos+=1
    }

    wheels = changedWheel
}
for i in 0..<n {
    if wheels[i][0] == "1" { count += 1}
}

print(count)
func move(wheel: [String], direction: Int) -> [String] {
    var wheel = wheel
    
    if direction == 1 {
        let last = wheel.removeLast()
        wheel = [last] + wheel
    } else {
        let first = wheel.removeFirst()
        wheel = wheel + [first]
    }
    return wheel
}

