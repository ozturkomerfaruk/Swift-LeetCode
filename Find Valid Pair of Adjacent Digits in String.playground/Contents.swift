import Foundation

func findValidPair(_ s: String) -> String {
    let freq = Dictionary(s.map { ($0, 1)}, uniquingKeysWith: +)
    
    for (a, b) in zip(s, s.dropFirst()) where a != b && freq[a] == a.wholeNumberValue && freq[b] == b.wholeNumberValue {
        return "\(a)\(b)"
    }
    
    return ""
}

let value1 = "2523533"
let value2 = "221"
let value3 = "22"
let value4 = "343211"

print(findValidPair(value1))
print(findValidPair(value2))
print(findValidPair(value3))
print(findValidPair(value4))
