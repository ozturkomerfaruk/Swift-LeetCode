import UIKit

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// This class contains optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///
class Solution {
    
    //3442. Maximum Difference Between Even and Odd Frequency I
    func maxDifference(_ s: String) -> Int {
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
    
    //3438. Find Valid Pair of Adjacent Digits in String
    func findValidPair(_ s: String) -> String {
        let freq = Dictionary(s.map { ($0, 1)}, uniquingKeysWith: +)
        
        for (a, b) in zip(s, s.dropFirst()) where a != b && freq[a] == a.wholeNumberValue && freq[b] == b.wholeNumberValue {
            return "\(a)\(b)"
        }
        
        return ""
    }
    
    //844. Backspace String Compare
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        //TODO:
        return false
    }
    
    //739. Daily Temperatures
    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
        var result: [Int] = Array(repeating: 0, count: temperatures.count)
        var stack: [(index: Int, temp: Int)] = []
        
        for (i, temp) in temperatures.enumerated() {
            while let last = stack.last, temp > last.temp {
                let (prevIndex, _) = stack.removeLast()
                result[prevIndex] = i - prevIndex
            }
            
            stack.append((i, temp))
        }
        
        return result
    }
    
    //682. Baseball Game
    func calPoints(_ operations: [String]) -> Int {
        var resultArray: [Int] = []
        
        operations.forEach {
            if let num = Int($0) {
                resultArray.append(num)
            } else if $0 == "C" {
                resultArray.removeLast()
            } else if $0 == "D" {
                let last = resultArray.last ?? 0
                resultArray.append(last * 2)
            } else if $0 == "+" {
                let sumValue = resultArray.suffix(2).reduce(0, +)
                resultArray.append(sumValue)
            }
        }
        
        return resultArray.lazy.compactMap(Int.init).reduce(0, +)
    }
    
    //509. Fibonacci Number
    func fib(_ n: Int) -> Int {
        //TODO
        return 0
    }
    
    //344. Reverse String
    func reverseString(_ s: inout [Character]) {
        //TODO
    }
    
    //287. Find the Duplicate Number
    func findDuplicate(_ nums: [Int]) -> Int {
        //TODO
        return 0
    }
    
    //242. Valid Anagram
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else { return false }
        
        var charCount = Array(repeating: 0, count: 26)
        let aAscii = Character("a").asciiValue!
        
        for (sc, tc) in zip(s, t) {
            charCount[Int(sc.asciiValue! - aAscii)] += 1
            charCount[Int(tc.asciiValue! - aAscii)] -= 1
        }
        
        return charCount.allSatisfy { $0 == 0 }
    }
    
    //226. Invert Binary Tree
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        //TODO
        return nil
    }
    
    //217. Contains Duplicate
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let numSet = Set(nums)
        return numSet.count != nums.count
    }
    
    //206. Reverse Linked List
    func reverseList(_ head: ListNode?) -> ListNode? {
        //TODO
        return nil
    }
    
    //203. Remove Linked List Elements
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        //TODO
        return nil
    }
    
    //202. Happy Number
    func isHappy(_ n: Int) -> Bool {
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
    
    func squareAndSumDigits(n: Int) -> Int {
        let digits: [Int] = String(n).map { Int(String($0))! }
        let sumOfSquares: Int = digits.reduce(0) { $0 + $1 * $1 }
        return sumOfSquares
    }
    
    //169. Majority Element
    func majorityElement(_ nums: [Int]) -> Int {
        
        var candidate: Int = 0
        var count: Int = 0
        
        nums.forEach {
            if count == 0 {
                candidate = $0
            }
            
            count += (candidate == $0) ? 1 : -1
        }
        
        return candidate
    }
    
    //160. Intersection of Two Linked Lists
    func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        //TODO
        return nil
    }
    
    //141. Linked List Cycle
    func hasCycle(_ head: ListNode?) -> Bool {
        //TODO
        return false
    }
    
    //136. Single Number
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        nums.forEach {
            result ^= $0
        }
        return result
    }
    
    //19. Remove Nth Node From End of List
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        var fast: ListNode? = dummy
        var slow: ListNode? = dummy
        
        for _ in 0...n {
            fast = fast?.next
        }
        
        while fast != nil {
            fast = fast?.next
            slow = slow?.next
        }
        
        slow?.next = slow?.next?.next
        
        return dummy.next
    }
    
    //14. Longest Common Prefix
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let first = strs.first else { return "" }
        return strs.reduce(first) {
            $0.commonPrefix(with: $1)
        }
    }
    
    //13. Roman to Integer
    func romanToInt(_ s: String) -> Int {
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
    
    //9. Palindrome Number
    func isPalindrome(_ x: Int) -> Bool {
        //TODO
        return false
    }
    
    //2698. Find the Punishment Number of an Integer
    func punishmentNumber(_ n: Int) -> Int {
        //TODO
        return 0
    }
    
    //26. Remove Duplicates from Sorted Array
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        #if true
        //Runtime 0ms 20.5 MB Memory
        guard nums.count > 1 else { return nums.count }
        
        var index = 1
        for num in nums.dropFirst() where num != nums[index - 1] {
            nums[index] = num
            index += 1
        }
        
        return index
        #else
        //Runtime 0ms 19.5 MB Memory
        var stack = [Int]()
                
                nums.forEach {
                    if !stack.contains($0) {
                        stack.append($0)
                    }
                }
                
                nums = stack
                return nums.count
        #endif
    }
}

let solution = Solution()
var nums = [0,0,1,1,1,2,2,3,3,4]
let answer = solution.removeDuplicates(&nums)
print(answer)

//TODO: Answers can be separated according to problem type.
