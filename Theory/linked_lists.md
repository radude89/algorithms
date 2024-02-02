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
