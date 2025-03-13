//
//  Extension.swift
//  
//
//  Created by Ömer Faruk Öztürk on 10.03.2025.
//

import Foundation

public extension Bool {
    func printValue() {
        print(self.description)
    }
}

public extension Int {
    func printValue() {
        print(self.description)
    }
}

public extension String {
    func printValue() {
        print(self.description)
    }
}

public extension Array {
    func printValue() {
        print(self.map { "\($0)" }.joined(separator: ", "))
    }
}
