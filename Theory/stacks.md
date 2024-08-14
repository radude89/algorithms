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
3. Recursion Stack.
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

## Infix/Postfix/Prefix

**Infix expression**: The expression of the form “a operator b” (a + b) i.e., when an operator is in-between every pair of operands.

**Postfix expression**: The expression of the form “a b operator” (ab+) i.e., When every pair of operands is followed by an operator.

**Prefix expression**: An expression is called the prefix expression if the operator appears in the expression before the operands. Simply of the form (operator operand1 operand2).

**Why?**

The repeated scanning makes it very inefficient. Infix expressions are easily readable and solvable by humans whereas the computer cannot differentiate the operators and parenthesis easily so, it is better to convert the expression to postfix(or prefix) form before evaluation.

Whenever we get an operand, add it to the postfix expression and if we get an operator or parenthesis add it to the stack by maintaining their precedence.

### Infix to Postfix

- [Source here](https://www.geeksforgeeks.org/convert-infix-expression-to-postfix-expression/)

<details>
  <summary>📸</summary>
    <img src="https://2.bp.blogspot.com/-uHvlZSEKfkM/Vdd6U82_qqI/AAAAAAAAAOg/CvlpyyJfOjg/s1600/InToPostExample.jpg" />
</details>

#### Algorithm

1. Scan input string from left to right character by character.
2. If the character is an operand, put it into output stack.
3. If the character is an operator and operator's stack is empty, push operator into operators' stack.
4. If the operator's stack is not empty, there may be following possibilites.
    1. If the precedence of scanned operator is greater than the top most operator of operator's stack, push this operator into operand's stack.
    2. If the precedence of scanned operator is less than or equal to the top most operator of operator's stack, pop the operators from operand's stack until we find a low precedence operator than the scanned character. Never pop out ( '(' ) or ( ')' ) whatever may be the precedence level of scanned character.
    3. If the character is opening round bracket ( '(' ), push it into operator's stack.
    4. If the character is closing round bracket ( ')' ), pop out operators from operator's stack untill we find an opening bracket ('(' ).
    5. Now pop out all the remaining operators from the operator's stack and push into output stack.

- [Source here](https://www.web4college.com/converters/infix-to-postfix-prefix.php#iToPos)

#### Implementation

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

#### Complexity

- Time Complexity: O(N), where N is the size of the infix expression
- Auxiliary Space: O(N), where N is the size of the infix expression

### Prefix to Infix

- [Source here](https://www.geeksforgeeks.org/prefix-infix-conversion/?ref=lbp)
- [Source #2 here](https://www.web4college.com/converters/postfix-prefix-to-infix.php)

<details>
  <summary>📸</summary>
  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20240730142029/Evaluate-the-prefix-expression-2.webp" />
</details>

#### Algorithm

- Read the Prefix expression in reverse order (from right to left).
- If the symbol is an operand, then push it onto the Stack.
- If the symbol is an operator, then pop two operands from the Stack:
    - Create a string by concatenating the two operands and the operator between them.
    - `string = (operand1 + operator + operand2)`
    - And push the resultant string back to Stack
- Repeat the above steps until the end of Prefix expression.
- At the end stack will have only 1 string i.e. resultant string.

#### Implementation

<details>
  <summary>Code implementation</summary>

```swift
let input = "*-A/BC*-/AKL+MN".stringByRemovingSpecialCharacters
let reversed = input.reversed()
let stack: StackList<String> = .init()
for char in reversed {
    if char.isLetter {
        stack.push(String(char))
    } else {
        let operand1 = stack.pop() ?? ""
        let operand2 = stack.pop() ?? ""
        let result = "(\(operand1)\(char)\(operand2))"
        stack.push(result)
    }
}
// Prints ((A-(B/C))*(((A/K)-L)*(M+N)))
print(stack.pop() ?? "")
```

</details>

#### Complexity

- Time Complexity: O(n)
- Auxiliary Space: O(n)

### Prefix to Postfix

- [Source here](https://www.geeksforgeeks.org/prefix-postfix-conversion/?ref=lbp)
- [Source #2 here](https://www.web4college.com/converters/postfix-to-prefix-to-postfix.php)
- [Source #3 here](https://www.geeksforgeeks.org/prefix-to-postfix-converter-online/)

#### Algorithm

1. Read the Prefix expression in reverse order (from right to left)
2. If the symbol is an operand, then push it onto the Stack
3. If the symbol is an operator, then pop two operands from the Stack
    1. Create a string by concatenating the two operands and the operator after them.
    2. `string = operand1 + operand2 + operator`
    3. And push the resultant string back to Stack
4. Repeat the above steps until end of Prefix expression.

#### Implementation

<details>
  <summary>Code implementation</summary>

```swift
for char in reversed {
    if char.isLetter {
        stack.push(String(char))
    } else {
        let operand1 = stack.pop() ?? ""
        let operand2 = stack.pop() ?? ""
        let result = "\(operand1)\(operand2)\(char)"
        stack.push(result)
    }
}
```

</details>

#### Complexity

- Time Complexity: O(N), as we are using a loop for traversing the expression.
- Auxiliary Space: O(N), as we are using stack for extra space.

### Postfix to Prefix

- [Source here](https://www.geeksforgeeks.org/postfix-prefix-conversion/)
- [Source #2 here](https://www.web4college.com/converters/postfix-to-prefix-to-postfix.php)

<details>
  <summary>📸</summary>

  <img src="https://www.helpmestudybro.com/wp-content/uploads/2020/06/Postfix2Prefix-1-1024x875.jpg" />

</details>

#### Algorithm

1. Read the Postfix expression from left to right.
2. If the symbol is an operand, then push it onto the Stack.
3. If the symbol is an operator, then pop two operands from the Stack.
4. Create a string by concatenating the two operands and the operator before them.<br />
`string = operator + operand2 + operand1`
5. And push the resultant string back to Stack
6. Repeat the above steps until end of Postfix expression.

#### Implementation

<details>
  <summary>Code implementation</summary>

```swift
static func postfixToPrefix() {
    let input = "ABC*DE-/+".stringByRemovingSpecialCharacters
    let stack: StackList<String> = .init()
    for char in input {
        if char.isLetter {
            stack.push(String(char))
        } else {
            let operand1 = stack.pop() ?? ""
            let operand2 = stack.pop() ?? ""
            let result = "\(char)\(operand2)\(operand1)"
            stack.push(result)
        }
    }
    print(stack.pop() ?? "")
}
```

</details>

#### Complexity

- Time Complexity: O(N).
- Auxiliary Space: O(N) - we are using an empty stack as well as empty string to store the expression hence space taken is linear.

### Postfix to Infix

- [Source here](https://www.geeksforgeeks.org/postfix-to-infix/)
- [Source #2 here](https://www.web4college.com/converters/postfix-prefix-to-infix.php)

<details>
  <summary>📸</summary>

  <img src="https://www.helpmestudybro.com/wp-content/uploads/2020/06/Postfix2Infix-1024x875.jpg" />

</details>

#### Algorithm

1. Read the Postfix expression from left to right.
2. If the symbol is an operand, then push it onto the Stack.
3. If the symbol is an operator, then pop two operands from the Stack.
4. Create a string by concatenating the two operands and the operator.<br />
`string = operand2 + operator + operand1`
5. And push the resultant string back to Stack
6. Repeat the above steps until end of Postfix expression.

#### Implementation

<details>
  <summary>Code implementation</summary>

```swift
static func postfixToInfix() {
    let input = "ABC++".stringByRemovingSpecialCharacters
    let stack: StackList<String> = .init()
    for char in input {
        if char.isLetter {
            stack.push(String(char))
        } else {
            let operand1 = stack.pop() ?? ""
            let operand2 = stack.pop() ?? ""
            let result = "(\(operand2)\(char)\(operand1))"
            stack.push(result)
        }
    }
    print(stack.pop() ?? "")
}
```

</details>

#### Complexity

- Time Complexity: O(N) where N is the length of the string.
- Auxiliary Space: O(N) where N is the stack size.

### Infix to Prefix

- [Source here](https://www.geeksforgeeks.org/convert-infix-prefix-notation/)
- [Source #2 here](https://www.web4college.com/converters/infix-to-postfix-prefix.php)

<details>
  <summary>📸</summary>

  <img src="https://media.geeksforgeeks.org/wp-content/uploads/20230324112657/infix-to-prefix.png" />

</details>

#### Algorithm

1. Reverse the input string.
2. Convert the reversed string into postfix expression.
3. Reverse the postfix expression.

#### Implementation

<details>
  <summary>Code implementation</summary>

  ```swift
  static func infixToPrefix() {
      let input = "A+B*C/(E-F)".stringByRemovingSpecialCharacters
      var result = ""
      for char in input {
          if char == "(" {
              result.append(")")
          } else if char == ")" {
              result.append("(")
          } else {
              result.append(char)
          }
      }
      let reversedInput = String(result.reversed())
      let postfix = infixToPostfix(input: reversedInput)
      let reversedPostfix = String(postfix.reversed())
      print(reversedPostfix)
  }
  ```

</details>

#### Complexity

- Time Complexity: O(N), where N is the size of the infix expression.
- Auxiliary Space: O(N), where N is the size of the infix expression.
