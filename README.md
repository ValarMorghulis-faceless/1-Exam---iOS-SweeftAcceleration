# Exam 1-iOS SweeftAcceleration

* დავალება 1
---
  
გვაქვს 1,5,10,20 და 50 თეთრიანი მონეტები. დაწერეთ ფუნქცია, რომელსაც გადაეცემა თანხა (თეთრებში) და აბრუნებს მონეტების მინიმალურ რაოდენობას, რომლითაც შეგვიძლია ეს თანხა დავახურდაოთ.

```swift
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
print(minSplit(cents: 34)) //[1, 1, 1, 1, 10, 20]
print(minSplit(cents: 188)) // [1, 1, 1, 5, 10, 20, 50, 50, 50]
print(minSplit(cents: 67)) // [1, 1, 5, 10, 50]
print(minSplit(cents: 789)) // [1, 1, 1, 1, 5, 10, 20, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50]
```
---
* დავალება 2 
---
დაწერეთ ფუნქცია რომელიც დააჯამებს ციფრებს ორ რიცსხვს შორის.
   მაგალითად გადმოგვეცემა 19 და 22. მათ შორის ციფრების ჯამი იქნება :
   // 19, 20, 21, 22
   // (1 + 9) + (2 + 0) + (2 + 1) + (2 + 2) = 19

```swift
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
print(sumOfDigits(start: 19, end: 22)) // 19
print(sumOfDigits(start: 34, end: 67)) // 313
print(sumOfDigits(start: 4, end: 21)) // 99
print(sumOfDigits(start: 90, end: 96)) // 84
```
---
* დავალება 3
---
მოცემულია String რომელიც შედგება „(" და „)" ელემენტებისგან. დაწერეთ ფუნქცია რომელიც აბრუნებს ფრჩხილები არის თუ არა მათემატიკურად სწორად დასმული.

```swift
import Foundation

func isProperly(sequence: String) -> Bool {
    let str = sequence.replacingOccurrences(of: "()", with: "")
    switch str {
    case "": return true
    case sequence: return false
    default: return isProperly(sequence: str)
    }
}

print(isProperly(sequence: "((()()))")) // true
print(isProperly(sequence: "((((())())((())" )) // false
print(isProperly(sequence: "()(")) // false
print(isProperly(sequence: "()()()()")) // true
```
---
* დავალება 4 
---
 გვაქვს N ფიცრისგან შემდგარი ხიდი. სიძველის გამო ზოგიერთი ფიცარი ჩატეხილია. ზურიკოს შეუძლია გადავიდეს შემდეგ ფიცარზე ან გადაახტეს ერთ ფიცარს. (რათქმაუნდა ჩატეხილ   ფიცარზე ვერ გადავა)
   ჩვენი ამოცანაა დავითვალოთ რამდენი განსხვავებული კომბინაციით შეუძლია ზურიკოს ხიდის გადალახვა. გადმოგვეცემა ხიდის სიგრძე და ინფორმაცია ჩატეხილ ფიცრებზე. 0 აღნიშნავს ჩატეხილ ფიცარს 1_ანი კი მთელს. დასაწყისისთვის ზურიკო დგას ხიდის ერთ მხარეს (არა პირველ ფიცარზე) და გადალახვად ჩათვლება ხიდის მეორე მხარე (ბოლო ფიცრის შემდეგი ნაბიჯი)

```swift
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
print(countWays(n: 3, steps: [0,1,0])) // 2
print(countWays(n: 4, steps: [0,1,1,0])) // 3
print(countWays(n: 5, steps: [1,1,0,1,1])) // 4 

```
**ეს კოდი შესაძლოა იყოს არასწორი რადგან ვერ მივხვდი ტესტ ქეისს ამოცანის [0,1,0] რატომ აბრუნებს 1 და [0,1,1,0] რატომ აბრუნებს 0**

---
* დავალება 5 
---
გადმოგეცემათ მთელი რიცხვი N. დაწერეთ ფუნქცია რომელიც დაითვლის რამდენი 0ით ბოლოვდება N! (ფაქტორიალი) შენიშვნა 1000! შედგება 2568 სიმბოლოსაგან. 
```swift
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
print(zeros(13)) // 2
print(zeros(148)) // 35
print(zeros(7909)) // 1974
print(zeros(345)) // 84
```
---