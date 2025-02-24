//
//  ListNode.swift
//
//
//  Created by Ömer Faruk Öztürk on 15.02.2025.
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

public final class MockLinkedList {
    public static func createLinkedList(from values: [Int]) -> ListNode? {
        guard !values.isEmpty else { return nil }
        let head = ListNode(values[0])
        var current = head
        for val in values.dropFirst() {
            current.next = ListNode(val)
            current = current.next!
        }
        return head
    }
}
