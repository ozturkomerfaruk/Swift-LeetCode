import Foundation

func isHappy(_ n: Int) -> Bool {
    guard n > 0 else { return false }
    
    var seen = Set<Int>()
    var current = n
    
    while current != 1 {
        if seen.contains(current) {
            print("seen: \(seen), current: \(current)")
            return false
        }
        seen.insert(current)
        current = squareAndSumDigits(n: current)
    }

    return true
}

func squareAndSumDigits(n: Int) -> Int {
    let digits: [Int] = String(n).map{ Int(String($0))! }
    let sumOfSquares: Int = digits.reduce(0) { $0 + $1 * $1 }
    print("digits: \(digits), suffix sum: \(sumOfSquares)")
    return sumOfSquares
}

print(isHappy(3412342342).description)
