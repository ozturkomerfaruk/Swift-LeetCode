import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

var tagSolution = Tags.linkedListEasy.create() as? LinkedListEasy

let l1 = MockLinkedList.createLinkedList(from: [1,0,1])

tagSolution?.getDecimalValue(l1).printValue()
