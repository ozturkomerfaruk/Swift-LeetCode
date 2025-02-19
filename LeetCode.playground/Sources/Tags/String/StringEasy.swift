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
        //TODO
    }

    //844. Backspace String Compare
    public func backspaceCompare(_ s: String, _ t: String) -> Bool {
        //TODO:
        return false
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

}
