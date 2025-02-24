//
//  LinkedListEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class LinkedListEasy {
    
    public init() {}
    
    //141. Linked List Cycle
    public func hasCycle(_ head: ListNode?) -> Bool {
        var fast: ListNode? = head
        var slow: ListNode? = head

        while fast != nil, fast?.next != nil {
            fast = fast?.next
            slow = slow?.next?.next
            
            if slow === fast {
                return true
            }
        }
        
        return false
    }

    //160. Intersection of Two Linked Lists
    public func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
        
        var aPointer = headA, bPointer = headB
        
        while aPointer !== bPointer {
            aPointer = (aPointer == nil) ? headB : aPointer?.next
            bPointer = (bPointer == nil) ? headA : bPointer?.next
        }
        
        return aPointer
    }

    //203. Remove Linked List Elements
    public func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        //TODO
        return nil
    }

    //206. Reverse Linked List
    public func reverseList(_ head: ListNode?) -> ListNode? {
        var prevNode: ListNode? = nil
        var current: ListNode? = head
        var nextNode: ListNode? = nil
        
        while current != nil {
            nextNode = current?.next
            current?.next = prevNode
            prevNode = current
            current = nextNode
        }
        
        return prevNode
    }
}
