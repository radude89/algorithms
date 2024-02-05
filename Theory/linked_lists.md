# Linked Lists

- [Understanding the basics of Linked List](https://www.geeksforgeeks.org/what-is-linked-list/)

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220712172013/Singlelinkedlist.png" />

**Head and Tail**: The linked list is accessed through the head node, which points to the first node in the list. The last node in the list points to NULL or nullptr, indicating the end of the list. This node is known as the tail node.

## Types of lists

**1. Single-linked list**

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220712172013/Singlelinkedlist.png" />

**2. Double-linked list**

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220712180755/Doublylinkedlist.png" />

**3. Circular linked list**

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220712181336/Circularlinkedlist.png" />

## Advantages

- Dynamic Size: memory allocation is done at runtime.
- Insertion and Deletion: adding or removing elements is efficient and easy to perform.
- Flexibility: they do not require a contiguous block of memory and can be easily reorganized.

## Disadvantages

- Random access: you can't access an element without traversal.
- Extra memory: they require additional memory for storing the pointers, compared to arrays.

## Algorithms for single-linked lists

### Inserting a node at the front

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2013/03/Linkedlist_insert_at_start.png" />

**Steps:**
- Make the first node of Linked List linked to the new node.
- Remove the head from the original first node of Linked List.
- Make the new node as the Head of the Linked List.

**Code:**

```swift
func insertNodeAtBeginning(data: T) {
    guard head != nil else {
        head = Node(data)
        return
    }

    let newNode = Node(data, next: head)
    head = newNode
}
```

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

### Inserting a node after a given node

**Steps:**
- Make the element to be inserted as a new node.
- Change the next pointer of given node to the new node.
- Now shift the original next pointer of given node to the next pointer of new node.

**Code:**

```swift
func insertNodeAfter(node: Node, data: T) {
    guard head != nil else {
        head = node
        return
    }

    let newNode = Node(data, next: node.next)
    node.next = newNode
}
```

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

### Inserting a node at the end

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2013/03/Linkedlist_insert_last.png" />

**Steps:**
- Go to the last node of the Linked List.
- Change the next pointer of last node from NULL to the new node.
- Make the next pointer of new node as NULL to show the end of Linked List.

**Code:**

```swift
func insertNodeAtEnd(data: T) {
    guard head != nil else {
        head = Node(data)
        return
    }

    var lastNode = head
    while lastNode?.next != nil {
        lastNode = lastNode?.next
    }

    let newNode = Node(data)
    lastNode?.next = newNode
}
```

**Complexity:**
- Time Complexity: O(n).
- Auxiliary Space: O(1).

## Deleting a node at the front

**Code**

```swift
func deleteNodeAtBeginning() {
    guard head != nil else {
        return
    }

    guard head?.next != nil else {
        head = nil
        return
    }

    let newHead = head?.next
    head = newHead
}
```

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

## Deleting a node at the end

**Code**

```swift
func deleteNodeAtEnd() {
    guard head != nil else {
        return
    }

    guard head?.next != nil else {
        head = nil
        return
    }

    var current = head
    while current?.next != nil {
        let nextNode = current?.next
        if nextNode?.next == nil {
            current?.next = nil
            break
        }
        current = nextNode
    }
}
```

**Complexity:**
- Time Complexity: O(n).
- Auxiliary Space: O(1).

## Deleting a node at a given index

**Code**

<details>
  <summary>v1</summary>

```swift
func delete(at position: Int) {
    guard head != nil else {
        return
    }

    if position == 0 {
        let newHead = head?.next
        head = newHead
        return
    }

    var currentIndex = 0
    var currentNode = head
    while currentNode?.next != nil {
        let nextNode = currentNode?.next
        currentIndex += 1
        if position == currentIndex {
            let nextNextNode = nextNode?.next
            currentNode?.next = nextNextNode
            break
        }
        currentNode = nextNode
    }
}
```

</details>

<details>
  <summary>v2</summary>

```swift
func delete(at index: Int) {
    if head == nil {
        return
    }

    if index == 0 {
        head = head?.next
        return
    }

    var currentNode = head
    var currentIndex = 0

    while currentNode != nil && currentIndex < index {
        if currentIndex + 1 == index {
            var nextNode = currentNode?.next
            currentNode?.next = nextNode?.next
            nextNode = nil
        }
        currentIndex += 1
        currentNode = currentNode?.next
    }
}
```

</details>

**Complexity for both:**
- Time Complexity: O(n).
- Auxiliary Space: O(1).

## Finding the Nth node from the end

- [More to read about the algorithm](https://www.geeksforgeeks.org/write-a-function-to-get-nth-node-in-a-linked-list/?ref=lbp).

**Code**

```swift
func findNodeFromTheEnd(_ position: Int) -> Node? {
    guard head != nil else {
        return nil
    }

    var firstPointer = head
    var secondPointer = head
    var currentIndex = 0

    while firstPointer?.next != nil {
        firstPointer = firstPointer?.next
        currentIndex += 1
        if currentIndex > position - 1 {
            secondPointer = secondPointer?.next
        }
    }

    if currentIndex >= position - 1 {
        return secondPointer
    }
    return nil
}
```

**Complexity:**
- Time and Space Complexity: O(n).
- Auxiliary Space: O(1).

## Algorithms for doubly-linked lists

### Inserting a node at the front

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2014/03/DLL_add_front1.png" />

**Steps**
- Firstly, allocate a new node (say new_node).
- Now put the required data in the new node.
- Make the next of new_node point to the current head of the doubly linked list.
- Make the previous of the current head point to new_node.
- Lastly, point head to new_node.


**Code**

```swift
func insertAtFront(data: T) {
    let node = Node(data)
    node.next = head
    node.prev = nil
    head?.prev = node
    head = node
}
```

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

### Inserting a node after a given node

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2014/03/DLL_add_middle1.png" />

**Steps**
- Firstly create a new node (say new_node).
- Now insert the data in the new node.
- Point the next of new_node to the next of prev_node.
- Point the next of prev_node to new_node.
- Point the previous of new_node to prev_node.
- Change the pointer of the new node’s previous pointer to new_node.

**Code**

```swift
func insert(after node: Node, data: T) {
    guard head != nil else {
        return
    }

    let nodeToInsert = Node(data)
    nodeToInsert.prev = node
    nodeToInsert.next = node.next
    node.next?.prev = nodeToInsert
    node.next = nodeToInsert
}
```

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

### Inserting a node before a given node

<img src="https://media.geeksforgeeks.org/wp-content/uploads/5-55-300x100.png" />

**Steps**
- Allocate memory for the new node, let it be called new_node.
- Put the data in new_node.
- Set the previous pointer of this new_node as the previous node of the next_node.
- Set the previous pointer of the next_node as the new_node.
- Set the next pointer of this new_node as the next_node.
- Now set the previous pointer of new_node.
  - If the previous node of the new_node is not NULL, then set the next pointer of this previous node as new_node.
  - Else, if the prev of new_node is NULL, it will be the new head node.

**Complexity:**
- Time Complexity: O(1).
- Auxiliary Space: O(1).

## Inserting a node at the end

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/gq/2014/03/DLL_add_end1.png" />

**Steps**

- Create a new node (say new_node).
- Put the value in the new node.
- Make the next pointer of new_node as null.
- If the list is empty, make new_node as the head.
- Otherwise, travel to the end of the linked list.
- Now make the next pointer of last node point to new_node.
- Change the previous pointer of new_node to the last node of the list.

**Code**

```swift
func insertAtEnd(data: T) {
    guard head != nil else {
        let node = Node(data)
        head = node
        return
    }

    var current = head
    while current?.next != nil {
        current = current?.next
    }

    let node = Node(data)
    node.next = nil
    node.prev = current
    current?.next = node
}
```

**Complexity:**
- Time Complexity: O(n).
- Auxiliary Space: O(1).
