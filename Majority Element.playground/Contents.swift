import Foundation

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

let value = majorityElement([2,2,1,1,1,2,2])
print(value)
    

