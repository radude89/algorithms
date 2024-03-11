# Stacks

- [Understanding the basics of Stacks](https://www.geeksforgeeks.org/stack-data-structure/?ref=shm)

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230726165552/Stack-Data-Structure.png" />

## What is a Stack

To implement a stack we need a top pointer.<br>
The order may be LIFO (Last In First Out) or FILO (First In Last Out). LIFO implies that the element that is inserted last, comes out first and FILO implies that the element that is inserted first, comes out last.

## Types of Stacks

1. **Fixed Size Stack**
- cannot grow or shrink dynamically.
- if you add more elements than its size, then it will produce a stack overflow error.
- if the stack is empty and you remove an element, then you will get an underflow error.

2. **Dynamic size**
- when the stack is full, it automatically increases its size to accommodate the new element.
- this type of stack is implemented with a `LinkedList`.

_Source [here](https://www.geeksforgeeks.org/introduction-to-stack-data-structure-and-algorithm-tutorials/)._

## Stack applications

1. Infix to Postfix/Prefix conversion.
2. Expression Evaluation.
3. Recurssion Stack.
4. Memory Management.
5. Balanced Parenthesis.
6. Undo-Redo.

### Other applications

- Tower of Hanoi.
- Stock span problems.
- Histogram problems.
- etc.

## Implementation

### Using LinkedList

In a linked list-based implementation, the push operation is implemented by creating a new node with the new element and setting the next pointer of the current top node to the new node.

The pop operation is implemented by setting the next pointer of the current top node to the next node and returning the value of the current top node.

_Source [here](https://www.geeksforgeeks.org/introduction-to-stack-data-structure-and-algorithm-tutorials/)._

```swift
final class StackList<T> {
    var top: Node?

    init(top: Node? = nil) {
        self.top = top
    }
}

extension StackList {
    final class Node {
        let data: T
        var link: Node?

        init(_ data: T, next: Node? = nil) {
            self.data = data
            self.link = next
        }
    }
}
```

#### Push and Pop

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220714004311/Stack-660x566.png" />

#### Push implementation

```swift
func push(_ data: T) {
    let newNode = Node(data)
    guard top != nil else {
        top = newNode
        return
    }

    newNode.link = top
    top = newNode
}
```

#### Pop implementation

```swift
@discardableResult
func pop() -> Node? {
    guard top != nil else {
        return nil
    }

    let nodeToPop = top
    top = nodeToPop?.link
    return nodeToPop
}
```

#### Complexity

| Operations | Complexity |
| --- | --- |
| push | O(1) |
| pop | O(1) |
| isEmpty | O(1) |
| peek | O(1) |

### Using arrays

In an array-based implementation, the push operation is implemented by incrementing the index of the top element and storing the new element at that index.

The pop operation is implemented by decrementing the index of the top element and returning the value stored at that index.

### Pros and Cons

**😀 LinkedList**
- Linked list implementation of stack can grow and shrink according to the needs at runtime.

**😀 Arrays**
- Easy to implement.
- Memory is saved as pointers are not involved.

**🥲 LinkedList**
- Requires extra memory due to the involvement of pointers.
- Random accessing of an element is not possible.

**🥲 Arrays**
- In some implementations depending of the programming language, dynamic size is not possible.
- The total size of the stack must be defined beforehand.

_Source [here](https://www.geeksforgeeks.org/introduction-to-stack-data-structure-and-algorithm-tutorials/)._

## Infix to Postfix

- Nice converter [here](https://www.web4college.com/converters/infix-to-postfix-prefix.php).


**Infix expression**: The expression of the form “a operator b” (a + b) i.e., when an operator is in-between every pair of operands.<br />
**Postfix expression**: The expression of the form “a b operator” (ab+) i.e., When every pair of operands is followed by an operator.

The repeated scanning makes it very inefficient. Infix expressions are easily readable and solvable by humans whereas the computer cannot differentiate the operators and parenthesis easily so, it is better to convert the expression to postfix(or prefix) form before evaluation.

Whenever we get an operand, add it to the postfix expression and if we get an operator or parenthesis add it to the stack by maintaining their precedence.

[Source here](https://www.geeksforgeeks.org/convert-infix-expression-to-postfix-expression/)

### Algorithm

<details>
  <summary>Code implementation</summary>

```swift
for char in input {
    if char.isLetter {
        outputStack.push(char)
    } else if char == "(" || operatorStack.isEmpty || operatorStack.peek == "(" {
        operatorStack.push(char)
    } else if char == ")" {
        while let current = operatorStack.pop(), current != "(" {
            outputStack.push(current)
        }
    } else if let currentOperator = Operator(char) {
        while let topOperator = Operator(operatorStack.peek),
              currentOperator.precedencePriority <= topOperator.precedencePriority,
              !operatorStack.isEmpty,
              operatorStack.peek != "(" {
            outputStack.push(Character(topOperator.rawValue))
            operatorStack.pop()
        }
        operatorStack.push(Character(currentOperator.rawValue))
    }
}
```

</details>

### Complexity

- Time Complexity: O(N), where N is the size of the infix expression
- Auxiliary Space: O(N), where N is the size of the infix expression
