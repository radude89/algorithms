# Queue

_Source [here](https://www.geeksforgeeks.org/introduction-to-queue-data-structure-and-algorithm-tutorials/)_

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240606165428/Introduction-to-Queue-(2).webp" />

## Introduction

Queue - FIFO. Analogy below:

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240410122927/FIFO-Principle-(First-In-First-Out).webp" />

Types of queues:

1. **Simple Queue**: Simple Queue simply follows FIFO Structure. We can only insert the element at the back and remove the element from the front of the queue.

2. **Double-Ended Queue (Dequeue)**: In a double-ended queue the insertion and deletion operations, both can be performed from both ends. They are of two types:
  - **Input Restricted Queue**: This is a simple queue. In this type of queue, the input can be taken from only one end but deletion can be done from any of the ends.
  - **Output Restricted Queue**: This is also a simple queue. In this type of queue, the input can be taken from both ends but deletion can be done from only one end.

3. **Circular Queue**: This is a special type of queue where the last position is connected back to the first position. Here also the operations are performed in FIFO order.

4. **Priority Queue**: A priority queue is a special queue where the elements are accessed based on the priority assigned to them. They are of two types:
  - **Ascending Priority Queue**: In Ascending Priority Queue, the elements are arranged in increasing order of their priority values. Element with smallest priority value is popped first.
  - **Descending Priority Queue**: In Descending Priority Queue, the elements are arranged in decreasing order of their priority values. Element with largest priority is popped first.

## Examples

### Queue implementation with Lists

<details>
  <summary>Code</summary>

```java
class QueueNode
{
	int data;
	QueueNode next;
	QueueNode(int a)
	{
	    data = a;
	    next = null;
	}
}

class MyQueue
{
  QueueNode front, rear;

	void push(int a)
	{
	    QueueNode node = new QueueNode(a);
      if(front == null) {
          front = rear = node;
      } else {
          rear.next = node;
          rear = node;
      }
	}

	int pop()
	{
      if(front == null) {
          return -1;
      }

      var data = front.data;
      front = front.next;
      if(front == null) {
          rear = null;
      }
      return data;
	}
}
```

</details>

### Queue implementation with Arrays

<details>
  <summary>Code</summary>

```swift
struct Queue<T> {
    var items: [T]

    init(items: [T] = []) {
        self.items = items
    }

    mutating func enqueue(_ item: T) {
        items.append(item)
    }

    mutating func dequeue() -> T? {
        items.removeFirst()
    }

    var peek: T? {
        items.first
    }
}
```

</details>

## Complexity

- O(1) for all operations
