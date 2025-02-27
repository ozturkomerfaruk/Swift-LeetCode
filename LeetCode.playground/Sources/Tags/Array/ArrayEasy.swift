//
//  ArrayEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

import Foundation

public class ArrayEasy {
    
    public init() {}
    
    //26. Remove Duplicates from Sorted Array
    public func removeDuplicates(_ nums: inout [Int]) -> Int {
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

    //27. Remove Element
    public func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var stack = [Int]()
        nums.forEach {
            if $0 != val {
                stack.append($0)
            }
        }
        
        nums = stack
        return nums.count
    }

    //136. Single Number
    public func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        nums.forEach {
            result ^= $0
        }
        return result
    }
    
    //35. Search Insert Position
    public func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        nums.firstIndex(of: target) ?? nums.firstIndex { $0 > target } ?? nums.count
    }
    
    //169. Majority Element
    public func majorityElement(_ nums: [Int]) -> Int {
        
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

    //217. Contains Duplicate
    public func containsDuplicate(_ nums: [Int]) -> Bool {
        let numSet = Set(nums)
        return numSet.count != nums.count
    }



    //682. Baseball Game
    public func calPoints(_ operations: [String]) -> Int {
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

    //3452. Sum of Good Numbers
    public func sumOfGoodNumbers(_ nums: [Int], _ k: Int) -> Int {
        var sum = 0
        
        for i in 0..<nums.count {
            if (i-k < 0 || nums[i] > nums[i-k]) &&
                (i+k > nums.count - 1 || nums[i] > nums[i+k]) {
                sum += nums[i]
            }
        }
        
        return sum
    }

}
