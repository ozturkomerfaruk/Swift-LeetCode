import Foundation

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///

let listA = [4,1,8,4,5]
let listB = [5,6,1,8,4,5]

let headA = MockLinkedList.createLinkedList(from: listA)
let headB = MockLinkedList.createLinkedList(from: listB)

var tagSolution = Tags.linkedListEasy.create() as? LinkedListEasy
tagSolution?.getIntersectionNode(headA, headB)
