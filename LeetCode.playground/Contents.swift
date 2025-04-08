import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

var tagSolution = Tags.treeEasy.create() as? TreeEasy
let root = MockTreeNode.createBinaryTree(from: [10,5,15,3,7,nil,18])
tagSolution?.rangeSumBST(root, 7, 15).printValue()
