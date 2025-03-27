//
//  LinkedListMedium.swift
//
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class LinkedListMedium {
    
    public init() {}
    
    //19. Remove Nth Node From End of List
    public func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
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
    
    //24. Swap Nodes in Pairs
    public func swapPairs(_ head: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        dummy.next = head
        
        var prev: ListNode? = dummy
        var first: ListNode? = head
        
        while let second = first?.next {
            let nextPair = second.next
            
            prev?.next = second
            second.next = first
            first?.next = nextPair
            
            prev = first
            first = nextPair
        }
        
        return dummy.next
    }
    
    //2181. Merge Nodes in Between Zeros
    public func mergeNodes(_ head: ListNode?) -> ListNode? {
        var current = head?.next
        var sum = 0
        let dummy = ListNode(0)
        var tail = dummy
        
        while let node = current {
            if node.val == 0 {
                tail.next = ListNode(sum)
                tail = tail.next!
                sum = 0
            } else {
                sum += node.val
            }
            
            current = node.next
        }
        
        return dummy.next
    }
}
