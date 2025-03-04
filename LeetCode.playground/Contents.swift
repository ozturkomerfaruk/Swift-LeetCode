import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

let numbers = [1, 3, 5, 7, 9, 11, 13, 15]

var tagSolution = Tags.stackEasy.create() as? StackEasy

var result = tagSolution?.removeOuterParentheses("(()())(())")

print(result!)
