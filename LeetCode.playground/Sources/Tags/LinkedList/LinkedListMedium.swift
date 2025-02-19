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

}
