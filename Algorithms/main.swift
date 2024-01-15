//
//  main.swift
//  Algorithms
//
//  Created by Radu Dan on 11.01.2022.
//

import Foundation

//LinkedList<Int>.executeOperations()
//DoublyLinkedList<Int>.executeOperations()
//CircularLinkedList<Int>.executeOperations()
//StackList<Int>.executeOperations()
//Queue<Int>.executeOperations()
//BinaryTree<Int>.executeOperations()

let text = "abb"
print(compress2(text: text))

func sumList(list: LinkedList<Int>, anotherList: LinkedList<Int>) -> LinkedList<Int> {
    guard list.head != nil else {
        return anotherList
    }
    
    guard anotherList.head != nil else {
        return list
    }
    
    var currentListNode = list.head
    var anotherListNode = anotherList.head
    var carry = false
    let sumList = LinkedList<Int>()
    var currentSumListNode: LinkedList<Int>.Node?
    
    while currentListNode != nil || anotherListNode != nil {
        let listData = currentListNode?.data ?? 0
        let anotherListData = anotherListNode?.data ?? 0
        var sumNodes = (carry ? 1 : 0) + listData + anotherListData
        
        if sumNodes >= 10 {
            sumNodes -= 10
            carry = true
        } else {
            carry = false
        }
        
        let sumNode = LinkedList<Int>.Node(sumNodes)
        
        if sumList.head == nil {
            sumList.head = sumNode
            currentSumListNode = sumNode
        } else {
            currentSumListNode?.next = sumNode
            currentSumListNode = sumNode
        }
        
        currentListNode = currentListNode?.next
        anotherListNode = anotherListNode?.next
    }
    
    if carry {
        currentSumListNode?.next = LinkedList<Int>.Node(1)
    }
    
    return sumList
}

let firstList = LinkedList<Int>()
firstList.head = LinkedList<Int>.Node(9)
firstList.head?.next = LinkedList<Int>.Node(9)
firstList.head?.next?.next = LinkedList<Int>.Node(9)

let secondList = LinkedList<Int>()
secondList.head = LinkedList<Int>.Node(9)
secondList.head?.next = LinkedList<Int>.Node(9)
secondList.head?.next?.next = LinkedList<Int>.Node(9)
secondList.head?.next?.next?.next = LinkedList<Int>.Node(1)

let result = sumList(list: firstList, anotherList: secondList)
print(result)
