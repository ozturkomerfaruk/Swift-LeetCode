import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

var tagSolution = Tags.mathMedium.create() as? MathMedium

let l1 = MockLinkedList.createLinkedList(from: [2,4,3])
let l2 = MockLinkedList.createLinkedList(from: [5,6,4])

tagSolution?.addTwoNumbers(l1, l2)?.printValue()
