//
//  MathMedium.swift
//  
//
//  Created by Ömer Faruk Öztürk on 19.03.2025.
//

import Foundation

public class MathMedium {
    
    public init() {}
    
    //2. Add Two Numbers
    /*
     Doğru Yaklaşım:
     İki listeyi paralel olarak gez ve basamak basamak topla.
     Taşmayı (carry) hesapla ve bir sonraki basamağa ekle.
     Uzunluğu farklı listelerde eksik kalan basamakları işle.
     Yeni bir bağlı liste oluştur ve sonucu buraya ekle.
    */
    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let dummy = ListNode(0)
        var current = dummy
        var carry = 0
        var list1 = l1, list2 = l2
        
        while list1 != nil || list2 != nil || carry != 0 {
            let val1 = list1?.val ?? 0
            let val2 = list2?.val ?? 0
            let sum = val1 + val2 + carry
            
            carry = sum / 10
            current.next = ListNode(sum % 10)
            current = current.next!
            
            list1 = list1?.next
            list2 = list2?.next
        }
        
        return dummy.next
    }
}
