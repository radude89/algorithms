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

## Circular linked lists

<img src="https://media.geeksforgeeks.org/wp-content/uploads/CircularLinkeList.png" />

The circular linked list is a linked list where all nodes are connected to form a circle. In a circular linked list, the first node and the last node are connected to each other which forms a circle. There is no NULL at the end.

There are generally two types of circular linked lists:

1. **Circular singly linked list**: In a circular Singly linked list, the last node of the list contains a pointer to the first node of the list. We traverse the circular singly linked list until we reach the same node where we started. The circular singly linked list has no beginning or end. No null value is present in the next part of any of the nodes.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220817185024/CircularSinglyLinkedList-660x172.png" />

2. **Circular Doubly linked list**: Circular Doubly Linked List has properties of both doubly linked list and circular linked list in which two consecutive elements are linked or connected by the previous and next pointer and the last node points to the first node by the next pointer and also the first node points to the last node by the previous pointer.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220817185057/Circulardoublylinkedlist-660x155.png" />

## Algorithms for circular singly linked lists

### Inserting a node at the beginning

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220818092431/CircularSinglyLinkedlist4.png" />

**Steps**
- Create a node, say T.
- Make T -> next = last -> next.
- last -> next = T.

**Code**

```swift
func insertAtBeginning(data: T) {
    guard last != nil else {
        let newNode = Node(data)
        last = newNode
        newNode.next = last
        return
    }

    let newNode = Node(data)
    newNode.next = last?.next
    last?.next = newNode
}
```

**Complexity**
- Time complexity: O(1).
- Auxiliary Space: O(1).

### Inserting a node at the end

<img src="https://media.geeksforgeeks.org/wp-content/uploads/CircularSinglyLinkedlist-7.png" />

**Steps**
- Create a node, say T
- Make T -> next = last -> next
- last -> next = T
- last = T

**Code**

```swift
func insertAtEnd(data: T) {
    let node = Node(data)
    guard last != nil else {
        last = node
        node.next = last
        return
    }

    node.next = last?.next
    last?.next = node
    last = node
}
```

**Complexity**
- Time complexity: O(1).
- Auxiliary Space: O(1).

### Inserting between nodes

<img src="https://media.geeksforgeeks.org/wp-content/uploads/CircularSinglyLinkedList9.png" />

**Steps**
- Create a node, say T.
- Search for the node after which T needs to be inserted, say that node is P.
- Make T -> next = P -> next;
- P -> next = T.

**Complexity**
- Time complexity: O(N).
- Auxiliary Space: O(1).

**Code**

```swift
func insertAfter(node: Node, data: T) {
    guard last != nil else {
        return
    }

    let newNode = Node(data)
    if node === last {
        newNode.next = last?.next
        last?.next = newNode
        last = newNode
        return
    }

    var current = last?.next
    while current !== last {
        if current === node {
            newNode.next = current?.next
            current?.next = newNode
            break
        }
        current = current?.next
    }
}
```

## Algorithms for circular doubly linked lists

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220830114920/doubly-660x177.jpg" />

**Applications of Circular Doubly Linked List**

- Implementation of Circular Data Structures: Circular doubly linked lists are extremely helpful in the construction of circular data structures like circular queues and circular buffers, which are both circular in nature.
- Implementing Undo-Redo Operations: Text editors and other software programs can use circular doubly linked lists to implement undo-redo operations.
- Music Player Playlist: Playlists in music players are frequently implemented using circular doubly linked lists. Each song is kept as a node in the list in this scenario, and the list can be circled to play the songs in the order they are listed.
- Cache Memory Management: To maintain track of the most recently used cache blocks, circular doubly linked lists are employed in cache memory management.

[Source here](https://www.geeksforgeeks.org/introduction-to-circular-doubly-linked-list/).

### Insert at beginning

**Code**

```swift
func insertAtBeginning(_ data: T) {
    let newNode = Node(data)
    guard head != nil else {
        newNode.next = newNode
        newNode.prev = newNode
        head = newNode
        return
    }

    newNode.next = head
    newNode.prev = head?.prev
    head?.prev?.next = newNode
    head?.prev = newNode
    head = newNode
}
```

**Complexity**
- Time complexity: O(1).
- Space complexity: O(1).

### Insert at end

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220830121544/2-660x355.png" />

**Code**

```swift
func append(_ data: T) {
    let newNode = Node(data)
    guard head != nil else {
        newNode.next = newNode
        newNode.prev = newNode
        head = newNode
        return
    }

    newNode.next = head
    newNode.prev = head?.prev
    head?.prev?.next = newNode
    head?.prev = newNode
}
```

**Complexity**
- Time complexity: O(1).
- Space complexity: O(1).

### Deletion

**Code**

```swift
func delete(node: CircularDoublyLinkedList<T>.Node) {
    guard head != nil else {
        return
    }

    if head === node && head?.next === head {
        head = nil
        return
    }

    node.prev?.next = node.next
    node.next?.prev = node.prev
    if node === head {
        head = head?.next
    }
}
```

**Complexity**
- Time complexity: O(1).
- Space complexity: O(1).
