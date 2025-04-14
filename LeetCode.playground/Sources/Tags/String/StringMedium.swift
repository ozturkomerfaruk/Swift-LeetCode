//
//  StringMedium.swift
//  
//
//  Created by Ömer Faruk Öztürk on 29.03.2025.
//

public class StringMedium {
    
    public init() {}
    
    //3. Longest Substring Without Repeating Characters
    public func lengthOfLongestSubstring(_ s: String) -> Int {
        var indexMap = [Character: Int]()
        var left = 0, maxLength = 0
        
        for (right, char) in s.enumerated() {
            if let prevIndex = indexMap[char], prevIndex >= left {
                left = prevIndex + 1
            }
            indexMap[char] = right
            maxLength = max(maxLength, right - left + 1)
        }

        return maxLength
    }
    
    //5. Longest Palindromic Substring
    public func longestPalindrome(_ s: String) -> String {
        let chars = Array(s)
        var start = 0
        var end = 0
        
        for i in 0..<chars.count {
            let len1 = expandAroundCentre(chars, left: i, right: i)
            let len2 = expandAroundCentre(chars, left: i, right: i + 1)
            let len = max(len1, len2)
            
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        return String(chars[start...end])
        
        func expandAroundCentre(_ chars: [Character], left: Int, right: Int) -> Int {
            var leftValue = left
            var rightValue = right

            while leftValue >= 0, rightValue < chars.count, chars[leftValue] == chars[rightValue] {
                leftValue -= 1
                rightValue += 1
            }

            return rightValue - leftValue - 1
        }
    }
    
    //6. Zigzag Conversion
    public func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1,
              numRows < s.count else { return s }
        
        var rows = Array(repeating: "", count: numRows)
        var currentRow = 0
        var goingDown = false
        
        for char in s {
            rows[currentRow].append(char)
            
            if currentRow == 0 || currentRow == numRows - 1 {
                goingDown.toggle()
            }
            
            currentRow = goingDown ? currentRow + 1 : currentRow - 1
        }
        
        return rows.joined()
    }
    
    //22. Generate Parentheses
    public func generateParenthesis(_ n: Int) -> [String] {
        
        func backtrack(open: Int, close: Int, current: String) {
            if current.count == n * 2 {
                result.append(current)
                return
            }
            
            if open < n {
                backtrack(open: open + 1, close: close, current: current + "(")
            }
            
            if close < open {
                backtrack(open: open, close: close + 1, current: current + ")")
            }
        }
        
        var result: [String] = []
        backtrack(open: 0, close: 0, current: "")
        return result
    }
}
