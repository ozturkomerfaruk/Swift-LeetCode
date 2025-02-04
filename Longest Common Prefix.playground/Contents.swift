import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    guard let first = strs.first else { return "" }
    
    return strs.reduce(first) {
        $0.commonPrefix(with: $1)
    }
}

let strs = ["flower","flow","flight"]
print(longestCommonPrefix(strs))
