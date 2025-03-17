//
//  TreeEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

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
}
