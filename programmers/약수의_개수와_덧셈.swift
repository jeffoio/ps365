import Foundation

func solution(_ left:Int, _ right:Int) -> Int {
    var sum = 0
    
    for i in left...right {
        if counter(i) % 2 == 0 {
            sum += i
        } else {
            sum -= i
        }
    }
    
    return sum
}


func counter(_ n: Int) -> Int {
    var count = 0
    
    for i in 1...n {
        if n % i == 0 { count += 1}
    }
    
    return count
}

