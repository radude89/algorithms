# Stacks

- [Understanding the basics of Stacks](https://www.geeksforgeeks.org/stack-data-structure/?ref=shm)

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230726165552/Stack-Data-Structure.png" />

## What is a Stack

To implement a stack we need a top pointer.<br>
The order may be LIFO (Last In First Out) or FILO (First In Last Out). LIFO implies that the element that is inserted last, comes out first and FILO implies that the element that is inserted first, comes out last.


## Implementation

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

## 
