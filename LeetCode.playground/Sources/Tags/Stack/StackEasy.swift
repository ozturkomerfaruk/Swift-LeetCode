//
//  StackEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 4.03.2025.
//

import Foundation

public class StackEasy {
    
    public init() {}
    
    //1021. Remove Outermost Parentheses
    public func removeOuterParentheses(_ s: String) -> String {
        var count = 0
        var result = ""
        
        s.forEach {
            if $0 == "(" {
                if count > 0 {
                    result.append($0)
                }
                count += 1
            } else {
                count -= 1
                if count > 0 {
                    result.append($0)
                }
            }
        }
        
        return result
    }
}
