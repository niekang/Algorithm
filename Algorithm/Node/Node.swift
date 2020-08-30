//
//  Node.swift
//  Algorithm
//
//  Created by MC on 2020/8/29.
//  Copyright © 2020 聂康. All rights reserved.
//

import Foundation

class Node: NSObject {
    var value: Int = 0
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}


// 倒数第k个节点
func findSufix(node: Node?, k: Int) -> Node? {
    var current: Node? = node
    var result: Node? = node
    var index = 0
    while current != nil && index < k - 1 {
        current = current?.next
        index += 1
    }
   
    while current?.next != nil {
        current = current?.next
        result = result?.next
    }
    return result
}

// 倒数打印链表
func printReverseNode(node: Node?) {
    if node != nil && node?.next != nil  {
        printReverseNode(node: node?.next)
    }
    print(node?.value ?? -1)
}

// 判断链表是否有环
func circleNode(node: Node?) -> Node? {
    var fast: Node? = node
    var slow: Node? = node
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast == slow {
            return fast
        }
    }
    return nil
}

// 链表环的大小
// 先找到第一次相遇的节点
// 再次走到此节点走了一个环的大小
func circleLength(node: Node?) -> Int {
    guard let node = circleNode(node: node) else { return 0 }
    var length = 1
    var current = node
    while current != node {
        length += 1
        current = current.next!
    }
    return length
}


func entryNodeOfLoop(node: Node?) -> Node? {
    var fast = node?.next
    var slow = node?.next
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
        if fast == slow {
            break
        }
    }
    if fast != nil {
        fast = node
        while fast != slow {
            fast = fast?.next
            slow = slow?.next
        }
    }
    return fast
}

// 删除链表节点
func deleteNode(head: Node?, node: Node?) {
    if head == nil || node == nil{
        return
    }
    if head?.next == nil && node != head{
        return
    }
    if node?.next != nil {
        let nextNode = node?.next
        node?.next = nextNode?.next
        node?.value = nextNode!.value
    }else {
        var nextNode = head?.next
        while nextNode?.next != node {
            nextNode = nextNode?.next
        }
        nextNode?.next = nil
    }
}

// 求两个链表的第一个公共节点
func firstCommonNode(head1: Node?, head2: Node?) -> Node? {
    if head1 == nil || head2 == nil {
        return nil
    }
    var count1 = 0
    var count2 = 0
    var tmpNode1 = head1
    var tmpNode2 = head2
    while tmpNode1?.next != nil {
        tmpNode1 = tmpNode1?.next
        count1 += 1
    }
    while tmpNode2?.next != nil {
        tmpNode2 = tmpNode2?.next
        count2 += 1
    }
    var step = count1 - count2
    while step > 0 {
        tmpNode1 = tmpNode1?.next
        step -= 1
    }
    while step < 0 {
        tmpNode2 = tmpNode2?.next
        step += 0
    }
    while tmpNode1 != tmpNode2 {
        tmpNode1 = tmpNode1?.next
        tmpNode2 = tmpNode2?.next
    }
    return tmpNode1 == tmpNode2 ? tmpNode1 : nil
}

// 有序链表合并
func mergeTwoNodeList(nodeList1: Node?, nodeList2: Node?) -> Node? {
    let mergeNode: Node? = Node(-1)
    var tmpNodeList1 = nodeList1
    var tmpNodeList2 = nodeList2
    while tmpNodeList1 != nil && tmpNodeList2 != nil {
        if tmpNodeList1!.value > tmpNodeList2!.value {
            mergeNode?.next = tmpNodeList1
            tmpNodeList1 = tmpNodeList1?.next
        }else {
            mergeNode?.next = tmpNodeList2
            tmpNodeList2 = tmpNodeList2?.next
        }
    }
    
    if tmpNodeList1 != nil {
        mergeNode?.next = tmpNodeList1
    }else if tmpNodeList2 != nil {
        mergeNode?.next = tmpNodeList2
    }
    return mergeNode?.next
}

// 链表反转
func reverseList(head: Node?) -> Node? {
    var current = head
    var last: Node?
    var next: Node?
    while current != nil {
        next = current?.next
        current?.next = last
        last = current
        current = next
    }
    return last
}
