# Trees

## Generic Trees

_Source [here](https://www.geeksforgeeks.org/generic-treesn-array-trees/?ref=outind)_

A collection of nodes where each node consists a reference to children nodes. Every node stores address of its children and very first node's address will be stored in a separate entry called root.

### Representing Trees as Arrays or Lists

The trees can be represented with arrays or linked lists, but we have the following disadvantages:
- In Linked list, we can not randomly access any child’s address. So it will be expensive.
- In array, we can randomly access the address of any child, but we can store only fixed number of children’s addresses in it.

Better approach: using dynamic arrays. We can randomly access any child’s address and the size of the vector is also not fixed.

```swift
class GenericTreeNode<T> {
    var data: T
    var children: [T]

    init(data: T, children: [T]) {
        self.data = data
        self.children = children
    }
}
```

### Representing Trees with First Child / Next Sibling

1. **First Child**: Each node in the tree has a link (or pointer) to its first child (if it has any children).
2. **Next Sibling**: Each node also has a link to its next sibling, which is the next child of the same parent (if it has any siblings).

The first step in this representation is to link all children of the same parent together from left to right. For example, if a node has three children, the first child will point to the second child, and the second child will point to the third child using the "next sibling" link.

In a standard tree representation, each parent node usually has direct links to all of its children. However, in the First Child/Next Sibling representation, the parent only retains a direct link to its first child. This is because the next sibling of that first child can be accessed through the "next sibling" link of the first child. The parent doesn't need to have direct links to all its children since these can be accessed by traversing through the sibling links.

```mathematica
  A
/ | \
B C  D
/ |  |
E F  G
```

In a traditional representation, the parent node A would have direct links to B, C, and D. Node B would have links to E and F, and C would have a link to G.

In the First Child/Next Sibling representation, the tree is reorganized as:

```mathematica
A
|
B -> C -> D
|
E -> F
|
G
```

- `A` points to its first child `B`.
- `B` points to its first child `E` and its next sibling `C`.
- `C` points to its first child `G` and its next sibling `D`.
- `D` has no children, so it doesn't point to any other node.
- `E` and `F` are siblings, so `E` points to `F`.

### Advantages

- Memory efficient – No extra links are required, hence a lot of memory is saved.
- Treated as binary trees – Since we are able to convert any generic tree to binary representation, we can treat all generic trees with a first child/next sibling representation as binary trees. Instead of left and right pointers, we just use firstChild and nextSibling.
- Many algorithms can be expressed more easily because it is just a binary tree.
- Each node is of fixed size, so no auxiliary array or vector is required.

### Complexity

- Time Complexity - O(n)
- Space Complexity - O(n), where `n` is the height of the tree (the maximum depth of any node)

For binary trees where the tree is balance the space complexity is O(log n).
