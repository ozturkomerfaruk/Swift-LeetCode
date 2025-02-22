//
//  Tags.swift
//
//
//  Created by Ömer Faruk Öztürk on 22.02.2025.
//

import Foundation

public enum Tags {
    case stringEasy
    case mathEasy
    
    public func create() -> Any {
        switch self {
        case .stringEasy: return StringEasy()
        case .mathEasy: return MathEasy()
        }
    }
}
