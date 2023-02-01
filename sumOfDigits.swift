import Foundation 


func sumOfDigits(start: Int, end: Int) -> Int {
    var sum: Int = 0
    var num = 0
    for i in start...end {
        num = i
        while num > 0 {
            sum += num % 10
            num /= 10
        }
    }
    return sum
}