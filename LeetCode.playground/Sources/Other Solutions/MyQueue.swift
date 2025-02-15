//
//  MyQueue.swift
//  
//
//  Created by Ömer Faruk Öztürk on 15.02.2025.
//

//232. Implement Queue using Stacks
class MyQueue {
    
    private var myStack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        myStack.append(x)
    }
    
    func pop() -> Int {
        for _ in 0..<myStack.count {
            myStack.append(myStack.removeFirst())
        }
        return myStack.removeFirst()
    }
    
    func peek() -> Int {
        myStack[0]
    }
    
    func empty() -> Bool {
        myStack.isEmpty
    }
}
