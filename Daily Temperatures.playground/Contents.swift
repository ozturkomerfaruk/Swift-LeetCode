import Foundation

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

let input1 = [73, 74, 75, 71, 69, 72, 76, 73]
let input2 = [30, 40, 50, 60]
let input3 = [30, 60, 90]

print(dailyTemperatures(input1))
print(dailyTemperatures(input2))
print(dailyTemperatures(input3))
