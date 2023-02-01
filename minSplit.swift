import Foundation

func minSplit(cents: Int) -> [Int] {
    let coins = [1, 5, 10, 20, 50]
    var amount = cents
    var coinCount: [Int] = []
    while amount > 0 {
        var filteredArray = coins.filter { $0 <= amount}
        coinCount.insert(filteredArray.max()!, at: 0)
        amount -= filteredArray.max()!
    }
    return coinCount
}
