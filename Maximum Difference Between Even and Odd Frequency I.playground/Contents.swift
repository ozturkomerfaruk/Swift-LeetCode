import Foundation

func maxDifference(_ s: String) -> Int {
    var dict: [Character: Int] = [:]
    
    s.forEach {
        dict[$0, default: 0] += 1
    }
    
    let oddFreq = dict.values.filter { $0 % 2 != 0 }
    let evenFreq = dict.values.filter { $0  % 2 == 0 }
    
    let max = oddFreq.max() ?? 0
    let min = evenFreq.min() ?? 0
    
    return max - min
}

let result = maxDifference("aaaaabbc")
print(result)
