import Foundation

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

let input1: [String] = ["5","2","C","D","+"]
print(calPoints(input1))

let input2: [String] = ["5","-2","4","C","D","9","+","+"]
print(calPoints(input2))

let input3: [String] = ["1","C"]
print(calPoints(input3))
