import Foundation

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

let number = romanToInt("III")
print("result: \(number)")
