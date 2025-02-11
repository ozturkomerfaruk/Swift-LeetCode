import Foundation

class ListNode {
    var val: Int
    var next: ListNode?
    init() { self.val = 0; self.next = nil; }
    init(_ val: Int) { self.val = val; self.next = nil; }
    init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    var fast: ListNode? = dummy
    var slow: ListNode? = dummy
    
    for _ in 0...n {
        fast = fast?.next
    }
    
    while fast != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    slow?.next = slow?.next?.next
    
    return dummy.next
}

func printLinkedList(_ head: ListNode?) {
    var current = head
    while current != nil {
        print(current!.val, terminator: " -> ")
        current = current?.next
    }
}

let head15 = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))))

printLinkedList(head15)
print("\n")

printLinkedList(removeNthFromEnd(head15, 3))
