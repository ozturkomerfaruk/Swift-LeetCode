//
//  BinarySearchTree.swift
//
//
//  Created by Ömer Faruk Öztürk on 8.03.2025.
//

public class BinarySearchTree {
    
    public var root: TreeNode?
    
    public init(root: TreeNode? = nil) {
        self.root = root
    }
    
    public func insert(_ value: Int) {
        root = insertNode(root, value)
    }
    
    public func contains(_ value: Int) -> Bool {
        var node = root
        
        while let current = node {
            if value == current.val {
                return true
            }
            node = value < current.val ? current.left : current.right
        }
        return false
    }
    
    public func remove(_ value: Int) {
        root = deleteNode(root, value)
    }
    
    public func min() -> Int? {
        minNode(root)?.val
    }
    
    public func max() -> Int? {
        maxNode(root)?.val
    }
    
    public func printTree() {
        printInOrder(root)
    }
}

extension BinarySearchTree {
    
    private func insertNode(_ node: TreeNode?, _ value: Int) -> TreeNode? {
        guard let node else {
            return TreeNode(value)
        }
        
        if value < node.val {
            node.left = insertNode(node.left, value)
        } else if value > node.val {
            node.right = insertNode(node.right, value)
        }
        return node
    }
    
    private func deleteNode(_ node: TreeNode?, _ value: Int) -> TreeNode? {
        guard let node else { return nil }
        
        if value < node.val {
            node.left = deleteNode(node.left, value)
        } else if value > node.val {
            node.right = deleteNode(node.right, value)
        } else {
            if node.left == nil {
                return node.right
            }
            if node.right == nil {
                return node.left
            }
            if let successor = minNode(node.right) {
                node.val = successor.val
                node.right = deleteNode(node.right, successor.val)
            }
        }
        return node
    }
    
    private func minNode(_ node: TreeNode?) -> TreeNode? {
        var current = node
        while let left = current?.left { current = left }
        return current
    }
    
    private func maxNode(_ node: TreeNode?) -> TreeNode? {
        var current = node
        while let right = current?.right { current = right }
        return current
    }
    
    private func printInOrder(_ node: TreeNode?) {
        guard let node = node else { return }
        printInOrder(node.left)
        print(node.val, terminator: " ")
        printInOrder(node.right)
    }
}

//Note:
///Dengesiz olması durumunda O logn yerine On olur. Bunun için daha dengeli AVL veya Red-Black gibi Tree'lere bakılması gerekir.
///Büyük veri setleri için heap yerine düz bir array içinde saklamak daha hızlı erişim ve daha az bellek kullanımı sağlar.
