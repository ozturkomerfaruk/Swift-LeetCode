import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    let numSet = Set(nums)
    return numSet.count != nums.count
}

let nums = [1, 2, 3, 1]
print(containsDuplicate(nums))
