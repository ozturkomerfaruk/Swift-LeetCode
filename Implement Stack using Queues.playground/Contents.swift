import Foundation

class MyStack {

    var queue: [Int] = []

    init() {
        
    }
    
    func push(_ x: Int) {
        queue.append(x)
    }
    
    func pop() -> Int {
        for _ in 0..<queue.count - 1 {
            queue.append(queue.removeFirst())
        }

        return queue.removeFirst()
    }
    
    func top() -> Int {
        queue.last ?? 0
    }
    
    func empty() -> Bool {
        queue.isEmpty
    }
}

var myStack = MyStack()
myStack.push(1)
myStack.push(2)
myStack.top()
myStack.pop()
myStack.empty()
