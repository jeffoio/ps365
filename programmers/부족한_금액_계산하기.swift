import Foundation

func solution(_ price:Int, _ money:Int, _ count:Int) -> Int64{
    let arr = Array(0...count).map{ $0 * price }
    let fullPrice = arr.reduce(0, +)
    
    return money >= fullPrice ? 0 : Int64(fullPrice - money)
}