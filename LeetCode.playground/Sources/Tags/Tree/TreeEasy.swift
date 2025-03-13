//
//  TreeEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class TreeEasy {
    
    public init() {}
    
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
}
