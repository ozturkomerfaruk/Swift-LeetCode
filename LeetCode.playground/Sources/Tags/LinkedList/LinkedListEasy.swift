//
//  LinkedListEasy.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.02.2025.
//

public class LinkedListEasy {
    
    public init() {}
    
    //21. Merge Two Sorted Lists
    public func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
#if false
        guard let list1 else { return list2 }
        guard let list2 else { return list1 }
        
        if list1.val < list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            return list2
        }
#else
        let dummy = ListNode(0)
        var tail: ListNode? = dummy
        var l1 = list1, l2 = list2
        
        while let n1 = l1, let n2 = l2 {
            if n1.val < n2.val {
                tail?.next = n1
                l1 = n1.next
            } else {
                tail?.next = n2
                l2 = n2.next
            }
            
            tail = tail?.next
        }
        
        tail?.next = l1 ?? l2
        return dummy.next
#endif
    }
    
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
