import UIKit

/// **LeetCode Solutions by Ömer Faruk Öztürk**
///
/// The classes of separated tags contain optimized solutions for various LeetCode problems.
///
/// **LeetCode** [Omer Faruk Ozturk on LeetCode](https://leetcode.com/u/omerfarukozturk026/)
/// **LinkedIn** [Omer Faruk Ozturk on LinkedIn](https://www.linkedin.com/in/ozturkomerfaruk/)
///


let node = ListNode(1, ListNode(2, ListNode(3, nil)))
let easy = LinkedListEasy()

var reversedNode: ListNode? = easy.reverseList(node)

while reversedNode != nil {
    print(reversedNode?.val)
    reversedNode = reversedNode?.next
}
