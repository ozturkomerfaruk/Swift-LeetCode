//
//  TreeNode.swift
//
//
//  Created by Ömer Faruk Öztürk on 15.02.2025.
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

public extension TreeNode {
    func printValue() {
        var queue: [TreeNode?] = [self]
        var result = [String]()

        while !queue.isEmpty {
            let current = queue.removeFirst()

            if let node = current {
                result.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append("nil")
            }
        }

        while result.last == "nil" { result.removeLast() }
        print(result.joined(separator: " -> "))
    }
}

public final class MockTreeNode {
    public static func createBinaryTree(from values: [Int?]) -> TreeNode? {
        guard !values.isEmpty else { return nil }
        
        let tree = BinarySearchTree()
        
        for value in values.compactMap({ $0 }) {
            tree.insert(value)
        }
        
        return tree.root
    }
}

