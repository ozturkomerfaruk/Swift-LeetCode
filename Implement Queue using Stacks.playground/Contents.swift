import Foundation

class MyQueue {
    
    private var myStack = [Int]()
    
    init() {
        
    }
    
    func push(_ x: Int) {
        myStack.append(x)
    }
    
    func pop() -> Int {
        for i in 0..<myStack.count {
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

var myQueue = MyQueue()
myQueue.push(1)
myQueue.push(2)
myQueue.push(3)
myQueue.push(4)

myQueue.pop()
myQueue.pop()

myQueue.peek()
myQueue.empty()
