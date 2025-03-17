import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

var tagSolution = Tags.treeEasy.create() as? TreeEasy

let node = MockTreeNode.createBinaryTree(from: [1,2,2,3])

tagSolution?.findMode(node).printValue()
//0 -> -10 -> 0 -> nil -> -3 -> nil -> 5 -> nil -> nil -> nil -> 9
 
