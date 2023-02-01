import Foundation

func zeros(_ n: Int) -> Int {
    var num = 0
    var num1 = n
    while num1 > 0 {
        num1 /= 5
        num += num1
    }
    return num
}