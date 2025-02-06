import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    
    nums.forEach {
        result ^= $0
    }
    
    return result
}

let nums = [4,1,2,1,2]
print(singleNumber(nums))
