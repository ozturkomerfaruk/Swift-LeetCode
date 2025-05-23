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
        guard x >= 0 else { return false }
        
        let digits = Array(String(x))
        var left = 0, right = digits.count - 1
        
        while left < right {
            if digits[left] != digits[right] { return false }
            left += 1
            right -= 1
        }
        return true
    }
    
    //66. Plus One
    public func plusOne(_ digits: [Int]) -> [Int] {
        var result = digits
        var i = result.count - 1
        while i >= 0 {
            if result[i] < 9 {
                result[i] += 1
                return result
            }
            
            result[i] = 0
            i -= 1
        }
        
        return [1] + result
    }
    
    //69. Sqrt(x)
    public func mySqrt(_ x: Int) -> Int {
        if x < 2 { return x }
        
        var left = 1, right = x
        
        while left <= right {
            let mid = left + (right - left) / 2
            if mid * mid == x {
                return mid
            } else if mid * mid < x {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return right
    }
    
    //70. Climbing Stairs
    public func climbStairs(_ n: Int) -> Int {
#if false
        guard n > 2 else { return n }
        var prev = 1, curr = 2
        for _ in 3...n {
            (prev, curr) = (curr, prev + curr)
        }
        return curr
#else
        guard n >= 0 else { return 0 }
        var dp = [Int](repeating: 0, count: n + 1)
        dp[0] = 1
        
        for i in 1...n {
            dp[i] += i - 1 >= 0 ? dp[i - 1] : 0
            dp[i] += i - 2 >= 0 ? dp[i - 2] : 0
            print(dp[i])
        }
        
        return dp[n]
#endif
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
        
        func squareAndSumDigits(n: Int) -> Int {
            let digits: [Int] = String(n).map { Int(String($0))! }
            let sumOfSquares: Int = digits.reduce(0) { $0 + $1 * $1 }
            return sumOfSquares
        }
    }
    
    //231. Power of Two
    public func isPowerOfTwo(_ n: Int) -> Bool {
#if true
        n > 0 && (n & (n - 1)) == 0
#else
        var num = n
        while num > 1 {
            if num % 2 != 0 {
                return false
            }
            num /= 2
        }
        
        return num == 1
#endif
    }
    
    //412. Fizz Buzz
    public func fizzBuzz(_ n: Int) -> [String] {
        var resultArray = [String]()
        resultArray.reserveCapacity(n) // Önceden kapasite ayır
        
        for i in 1...n {
            let divisibleBy3 = (i % 3 == 0)
            let divisibleBy5 = (i % 5 == 0)

            if divisibleBy3 && divisibleBy5 {
                resultArray.append("FizzBuzz")
            } else if divisibleBy3 {
                resultArray.append("Fizz")
            } else if divisibleBy5 {
                resultArray.append("Buzz")
            } else {
                resultArray.append("\(i)")
            }
        }
        return resultArray
    }

    //509. Fibonacci Number
    public func fib(_ n: Int) -> Int {
#if false
        if n < 2 { return n }
        return fib(n - 1) + fib(n - 2)
#else
        if n < 2 { return n }
        
        var a = 0, b = 1
        for _ in 2...n {
            (a, b) = (b, a + b)
        }
        
        return b
#endif
    }
    
    //349. Intersection of Two Arrays
    public func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        Array(Set(nums1).intersection(nums2))
    }
    
    //3360. Stone Removal Game
    public func canAliceWin(_ n: Int) -> Bool {
        var totalStone = n
        var take = 10
        var isTurnAlice = true
        
        while totalStone >= take {
            totalStone -= take
            take -= 1
            isTurnAlice.toggle()
        }
        
        return !isTurnAlice
    }
}
