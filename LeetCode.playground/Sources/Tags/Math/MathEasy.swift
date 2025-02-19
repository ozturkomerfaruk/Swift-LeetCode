//
//  MathEasy.swift
//
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class MathEasy {
    
    public init() {}
    
    //9. Palindrome Number
    public func isPalindrome(_ x: Int) -> Bool {
        //TODO
        return false
    }

    //202. Happy Number
    public func isHappy(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        
        var seen = Set<Int>()
        var current = n
        
        while current != 1 {
            if seen.contains(current) {
                return false
            }
            
            seen.insert(current)
            current = squareAndSumDigits(n: current)
        }
        
        return true
    }

    private func squareAndSumDigits(n: Int) -> Int {
        let digits: [Int] = String(n).map { Int(String($0))! }
        let sumOfSquares: Int = digits.reduce(0) { $0 + $1 * $1 }
        return sumOfSquares
    }

    //509. Fibonacci Number
    public func fib(_ n: Int) -> Int {
        //TODO
        return 0
    }
}
