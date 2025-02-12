import Foundation

#if false
func isAnagram(_ s: String, _ t: String) -> Bool {
    return Array(s).sorted() == Array(t).sorted()
}

#elseif false
func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var sCharacters = [Character: Int]()
    s.forEach {
        sCharacters[$0, default: 0] += 1
    }
    
    for char in t {
        guard let count = sCharacters[char], count > 0 else { return false }
        sCharacters[char] = count - 1
    }
    
    return true
}
#elseif true
func isAnagram(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var charCount = Array(repeating: 0, count: 26)
    let aAscii = Character("a").asciiValue! // 97
    
    for (sc, tc) in zip(s, t) {
        charCount[Int(sc.asciiValue! - aAscii)] += 1
        charCount[Int(tc.asciiValue! - aAscii)] -= 1
    }
    
    return charCount.allSatisfy { $0 == 0 }
}
#endif

let value = isAnagram("tac", "cat")
print(value)
    
