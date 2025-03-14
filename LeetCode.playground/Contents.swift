import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

var tagSolution = Tags.treeEasy.create() as? TreeEasy

let p = MockTreeNode.createBinaryTree(from: [1,2,3])
let q = MockTreeNode.createBinaryTree(from: [1,2,3])

var result = tagSolution?.isSameTree(p, q)

result?.printValue()
