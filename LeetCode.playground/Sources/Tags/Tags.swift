//
//  Tags.swift
//
//
//  Created by Ömer Faruk Öztürk on 22.02.2025.
//

public enum Tags {
    case stringEasy
    case stringMedium
    case mathEasy
    case mathMedium
    case linkedListEasy
    case linkedListMedium
    case arrayEasy
    case arrayMedium
    case stackEasy
    case treeEasy
    
    public func create() -> Any {
        switch self {
        case .stringEasy: return StringEasy()
        case .stringMedium: return StringMedium()
        case .mathEasy: return MathEasy()
        case .mathMedium: return MathMedium()
        case .linkedListEasy: return LinkedListEasy()
        case .linkedListMedium: return LinkedListMedium()
        case .arrayEasy: return ArrayEasy()
        case .arrayMedium: return ArrayMedium()
        case .stackEasy: return StackEasy()
        case .treeEasy: return TreeEasy()
        }
    }
}
