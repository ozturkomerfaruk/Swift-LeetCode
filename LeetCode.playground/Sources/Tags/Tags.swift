//
//  Tags.swift
//
//
//  Created by Ömer Faruk Öztürk on 22.02.2025.
//

public enum Tags {
    case stringEasy
    case mathEasy
    case linkedListEasy
    case linkedListMedium
    
    public func create() -> Any {
        switch self {
        case .stringEasy: return StringEasy()
        case .mathEasy: return MathEasy()
        case .linkedListEasy: return LinkedListEasy()
        case .linkedListMedium: return LinkedListMedium()
        }
    }
}
