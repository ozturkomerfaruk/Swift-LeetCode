//
//  ArrayMedium.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class ArrayMedium {
    
    public init() {}
    
    //287. Find the Duplicate Number
    public func findDuplicate(_ nums: [Int]) -> Int {
        var slow = nums[0]
        var fast = nums[0]
        
        repeat {
            slow = nums[slow]
            fast = nums[nums[fast]]
        } while slow != fast
        
        slow = nums[0]
        
        while slow != fast {
            slow = nums[slow]
            fast = nums[fast]
        }

        return slow
    }

    //739. Daily Temperatures
    public func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
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
}
