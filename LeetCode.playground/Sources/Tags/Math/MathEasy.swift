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
    
    //412. Fizz Buzz
    ///reserveCapacity(n) -> Önceden bellek ayırarak dinamik array genişlemesini engeller.
    ///String birleştirme kaldırıldı -> += yerine append("FizzBuzz") doğrudan çağrıldı.
    ///% işlemleri azaltıldı -> Fazladan if kontrolü yerine önceden hesaplanmış boolean değerler kullanıldı.
    ///Daha az gereksiz işlem -> result.isEmpty yerine doğrudan if bloklarıyla ekleme yapıldı.
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
        if n < 2 { return n }

        var a = 0, b = 1
        for _ in 2...n {
            (a, b) = (b, a + b)
        }

        return b
    }
}
