import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

let tree = BinarySearchTree()
tree.insert(5)
tree.insert(5)
tree.insert(2)
tree.insert(7)
tree.insert(3)
tree.insert(8)
tree.insert(9)
tree.insert(1)
tree.insert(4)
tree.insert(6)
tree.printTree()

print(tree.contains(4).description)
print(tree.contains(10).description)

print(tree.min()!)
print(tree.max()!)
