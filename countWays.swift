import Foundation 


func countWays(n: Int ,steps: [Int]) -> Int {
    var plankarr = steps
    plankarr.append(1)
    plankarr.insert(1, at: 0)
    let n = plankarr.count
    var ways = Array(repeating: 0, count: n)
    ways[0] = 1
    ways[1] = 1
    
    for i in 2..<n {
        if plankarr[i] == 1 {
            ways[i] = ways[i-1] + ways[i-2]
        }
    }
    
    return ways[n-1]
}