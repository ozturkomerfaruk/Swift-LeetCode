//
//  StringEasy.swift
//
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

import Foundation

public class StringEasy {
    
    public init() {}
    
    //13. Roman to Integer
    public func romanToInt(_ s: String) -> Int {
        let romanValues: [Character: Int] = [
            "M": 1000,
            "D": 500,
            "C": 100,
            "L": 50,
            "X": 10,
            "V": 5,
            "I": 1
        ]
        
        var result = 0
        var previosValue = 0
        
        s.reversed().forEach {
            guard let currentValue = romanValues[$0] else { return }
            
            if currentValue < previosValue {
                result -= currentValue
            } else {
                result += currentValue
            }
            previosValue = currentValue
        }
        
        return result
    }
    
    //14. Longest Common Prefix
    public func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        return strs.reduce(first) {
            $0.commonPrefix(with: $1)
        }
    }
    
    //58. Length of Last Word
    public func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
    
    //67. Add Binary
    public func addBinary(_ a: String, _ b: String) -> String {
#if false
        let aChars = Array(a.reversed())
        let bChars = Array(b.reversed())
        
        var result = ""
        var carry = 0
        let maxLength = max(aChars.count, bChars.count)
        
        for i in 0..<maxLength {
            let digitA = i < aChars.count ? Int(String(aChars[i]))! : 0
            let digitB = i < bChars.count ? Int(String(bChars[i]))! : 0
            
            let sum = digitA + digitB + carry
            result.append(String(sum % 2))
            carry = sum / 2
        }
        
        if carry > 0 {
            result.append(String(carry))
        }
        
        return String(result.reversed())
#elseif true
        var i = a.count - 1, j = b.count - 1, carry = 0
        var result = ""
        
        let aChars = Array(a)
        let bChars = Array(b)
        
        while i >= 0 || j >= 0 || carry != 0 {
            let digitA = i >= 0 ? Int(String(aChars[i]))! : 0
            let digitB = j >= 0 ? Int(String(bChars[j]))! : 0
            
            let sum = digitA + digitB + carry
            result.append(String(sum % 2))
            carry = sum / 2
            
            i -= 1
            j -= 1
        }
        
        return String(result.reversed())
#elseif false
        //FAIL
        ///a: 10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101
        ///b: 110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011
        guard let aInt = Int(a, radix: 2), let bInt = Int(b, radix: 2) else {
            return ""
        }
        let sum = aInt + bInt
        return String(sum, radix: 2)
#endif
    }
    
    //242. Valid Anagram
    public func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var charCount = Array(repeating: 0, count: 26)
        let aAscii = Character("a").asciiValue!
        
        for (sc, tc) in zip(s, t) {
            charCount[Int(sc.asciiValue! - aAscii)] += 1
            charCount[Int(tc.asciiValue! - aAscii)] -= 1
        }
        
        return charCount.allSatisfy { $0 == 0 }
    }
    
    //344. Reverse String
    public func reverseString(_ s: inout [Character]) {
#if true
        func reverseRecursive(str: [Character], start: Int, end: Int) {
            if start >= end { return }
            
            s.swapAt(start, end)
            reverseRecursive(str: str, start: start + 1, end: end - 1)
        }
        
        reverseRecursive(str: s, start: 0, end: s.count - 1)
#else
        s.reverse()
#endif
    }
    
    //844. Backspace String Compare
    public func backspaceCompare(_ s: String, _ t: String) -> Bool {
        func process(_ str: String) -> [Character] {
            var stack: [Character] = []
            str.forEach {
                if $0 == "#" {
                    if !stack.isEmpty {
                        stack.removeLast()
                    }
                } else {
                    stack.append($0)
                }
            }
            
            print(stack)
            return stack
        }
        
        return process(s) == process(t)
    }
    
    //3110. Score of a String
    public func scoreOfString(_ s: String) -> Int {
#if false
        let result = s.indices.map { Int(s[$0].asciiValue!) }
        var sum = 0
        
        for i in result.indices {
            if i + 1 == result.count {
                break
            }
            
            sum += abs(result[i] - result[i+1])
        }
        
        return sum
#else
        zip(s, s.dropFirst()).reduce(0) { $0 + abs(Int($1.0.asciiValue!) - Int($1.1.asciiValue!)) }
#endif
    }
    
    //3438. Find Valid Pair of Adjacent Digits in String
    public func findValidPair(_ s: String) -> String {
        let freq = Dictionary(s.map { ($0, 1)}, uniquingKeysWith: +)
        
        for (a, b) in zip(s, s.dropFirst()) where a != b && freq[a] == a.wholeNumberValue && freq[b] == b.wholeNumberValue {
            return "\(a)\(b)"
        }
        
        return ""
    }
    
    //3442. Maximum Difference Between Even and Odd Frequency I
    public func maxDifference(_ s: String) -> Int {
        var dict: [Character: Int] = [:]
        
        s.forEach {
            dict[$0, default: 0] += 1
        }
        
        let oddFreq = dict.values.filter { $0 % 2 != 0 }
        let evenFreq = dict.values.filter { $0 % 2 == 0 }
        
        let max = oddFreq.max() ?? 0
        let min = evenFreq.min() ?? 0
        
        return max - min
    }
    
    //3461. Check If Digits Are Equal in String After Operations I
    public func hasSameDigits(_ s: String) -> Bool {
        var digits = s.map { Int(String($0))! }
        
        while digits.count > 2 {
            digits = zip(digits, digits.dropFirst()).map { ($0 + $1) % 10 }
        }
        
        return digits[0] == digits[1]
    }
}
