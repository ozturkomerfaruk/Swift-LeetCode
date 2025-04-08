//
//  TreeEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

import Foundation

public class TreeEasy {
    
    public init() {}
    
    //100. Same Tree
    public func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        guard let p = p, let q = q, p.val == q.val else { return p == nil && q == nil }

        let leftSame = isSameTree(p.left, q.left)
        let rightSame = isSameTree(p.right, q.right)
        
        return leftSame && rightSame
    }
    
    //108. Convert Sorted Array to Binary Search Tree
    public func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        func helper(_ left: Int, _ right: Int) -> TreeNode? {
            guard left <= right else { return nil }
            
            let mid = (left + right) / 2
            let root = TreeNode(nums[mid])
            root.left = helper(left, mid - 1)
            root.right = helper(mid + 1, right)
            
            return root
        }
        
        return helper(0, nums.count - 1)
    }
    
    
    //222. Count Complete Tree Nodes
    public func countNodes(_ root: TreeNode?) -> Int {
#if false
        var layerCount = 0
        
        func helper(_ root: TreeNode?) -> Int {
            guard let root else { return layerCount }
            
            _ = helper(root.left)
            _ = helper(root.right)
            
            layerCount += 1
            return layerCount
        }
        
        return helper(root)
#else
        guard let root else { return 0 }
        var leftDepth = 0, rightDepth = 0
        var leftNode: TreeNode? = root, rightNode: TreeNode? = root
        
        while leftNode != nil {
            leftNode = leftNode?.left
            leftDepth += 1
        }
        
        while rightNode != nil {
            rightNode = rightNode?.right
            rightDepth += 1
        }
        
        if leftDepth == rightDepth {
            return (1 << leftDepth) - 1 // 2^h - 1
        }
        
        return 1 + countNodes(root.left) + countNodes(root.right)
#endif
    }
    
    //226. Invert Binary Tree
    public func invertTree(_ root: TreeNode?) -> TreeNode? {
        //MARK: Tree Traversal
#if true
        //Preorder Traversal ile Çözüm (DFS - Recursive)
        guard let root else { return nil }
        
        (root.left, root.right) = (root.right, root.left)
        
        _ = invertTree(root.left)
        _ = invertTree(root.right)
        
        return root
#else
        //Level-Order Traversal (BFS - Queue) ile Çözüm
        guard let root else { return nil }
        
        var queue: [TreeNode] = [root]
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            (node.left, node.right) = (node.right, node.left)
            
            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }
        }
        
        return root
#endif
    }
    
    //501. Find Mode in Binary Search Tree
    public func findMode(_ root: TreeNode?) -> [Int] {
        var currentVal: Int?
        var currentCount = 0, maxCount = 0
        var modes: [Int] = []
        
        func inOrderTraversal(_ node: TreeNode?) {
            guard let node else { return }
            
            inOrderTraversal(node.left)
            
            if currentVal == node.val {
                currentCount += 1
            } else {
                currentVal = node.val
                currentCount = 1
            }
            
            if currentCount > maxCount {
                maxCount = currentCount
                modes = [node.val]
            } else if currentCount == maxCount {
                modes.append(node.val)
            }
            
            inOrderTraversal(node.right)
        }
        
        inOrderTraversal(root)
        return modes
    }
    
    //938. Range Sum of BST
    public func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        
        if root.val < low {
            return rangeSumBST(root.right, low, high)
        } else if root.val > high {
            return rangeSumBST(root.left, low, high)
        } else {
            return root.val +
            rangeSumBST(root.left, low, high) +
            rangeSumBST(root.right, low, high)
        }
    }
}
