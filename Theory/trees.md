# Trees

_Source [here](https://www.geeksforgeeks.org/types-of-trees-in-data-structures/)_
<img src="https://media.geeksforgeeks.org/wp-content/uploads/20230111154258/typoes1.png" />

## Generic Trees (N-ary Trees)

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

## Binary Trees

Each node has only two children.

Internal nodes = the nodes that are not leaves

### Degenerate Binary Tree

A degenerate binary tree, also known as a pathological binary tree, is a type of binary tree where each parent node has only one child. This means that the tree is essentially a linked list, with no node having two children.

The height equals number of nodes. Complexity is O(n).

The tree is highly unbalanced, as all nodes are aligned along a single path.

<details>
  <summary>Formulas</summary>

```plaintext
# 1. Height of the Tree (h):
h = N - 1

# 2. Number of Internal Nodes (I):
I = N - 1

# 3. Number of Leaf Nodes (L):
L = 1

# 4. Number of Nodes (N):
N = h + 1

# 5. Node Indexing (Array Representation):
Parent(i) = i - 1  # for i > 0
Child(i) = i + 1   # for i < N-1
```

</details>

### Full Binary Tree

A full binary tree is a binary tree with either zero or two child nodes for each node.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20221229135813/full.png" />

<details>
  <summary>Formulas</summary>

```plaintext
# Full Binary Tree Key Formulas

# 1. Total Number of Nodes (N):
N = 2L - 1  # in terms of leaves (L)
N = 2I + 1  # in terms of internal nodes (I)

# 2. Number of Leaves (L):
L = I + 1  # in terms of internal nodes (I)
L = 2^h    # in terms of height (h)

# 3. Height of the Tree (h):
h = log2(L)                          # in terms of leaves (L)
h = log2((N + 1) / 2)                # in terms of total nodes (N)

# 4. Number of Internal Nodes (I):
I = L - 1        # in terms of leaves (L)
I = (N - 1) / 2  # in terms of total nodes (N)

# 5. Minimum and Maximum Height (h) Given N Nodes:
h_min = log2((N + 1) / 2)  # minimum height
h_max = N - 1              # maximum height (degenerate tree)

# 6. Sum of Heights of All Nodes:
Sum_of_heights = N * h - (2^h - 1)
```

</details>

### Complete Binary Tree

A complete binary tree is a binary tree in which all levels, except possibly the last, are completely filled, and all nodes are as far left as possible.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220414154428/complete-200x132.jpg" />

<details>
  <summary>Formulas</summary>

```plaintext
# 1. Height of the Tree (h):
h = ceil(log2(N))

# 2. Maximum Number of Nodes at a Given Height (h):
N = 2^h - 1

# 3. Number of Nodes (N):
2^(h-1) <= N < 2^h

# 4. Number of Leaf Nodes (L):
L ≈ N / 2

# 5. Number of Internal Nodes (I):
I = N - L

# 6. Index of Parent and Children (for Array Representation):
Parent = floor(i / 2)
Left Child = 2 * i
Right Child = 2 * i + 1
```

</details>

### Perfect Binary Tree

A perfect binary tree is a special type of binary tree in which all the leaf nodes are at the same depth, and all non-leaf nodes have two children. In simple terms, this means that all leaf nodes are at the maximum depth of the tree, and the tree is completely filled with no gaps.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20220630154756/img2.jpg" />

<details>
  <summary>Formulas</summary>

```plaintext
1. Number of Nodes (N):
   N = 2^(h + 1) - 1

2. Number of Nodes (N) in terms of levels (l):
   N = 2^l - 1

3. Height of the Tree (h):
   h = log2(N + 1) - 1
```

</details>

### Balanced Binary Tree

A height balanced binary tree is a binary tree in which the height of the left subtree and right subtree of any node does not differ by more than 1 and both the left and right subtree are also height balanced.

This property ensures that the tree remains relatively flat and well-proportioned, leading to efficient operations such as insertion, deletion, and lookup, which can be performed in logarithmic time (`O(log n`)).

<img src="https://media.geeksforgeeks.org/wp-content/uploads/tree.jpg" />

<details>
  <summary>Formulas</summary>

```plaintext
# Height of a Perfect Binary Tree
h = log2(n + 1) - 1

# Number of Nodes in a Perfect Binary Tree
n = 2^(h + 1) - 1

# Number of Leaf Nodes in a Perfect Binary Tree
L = 2^h
```

</details>

### Binary Search Tree

A Binary Search Tree is a data structure used in computer science for organizing and storing data in a sorted manner. Each node in a Binary Search Tree has at most two children, a left child and a right child, with the left child containing values less than the parent node and the right child containing values greater than the parent node.

<img src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20221215114732/bst-21.png" />

<details>
  <summary>Formulas</summary>

```plaintext
# Height of a Binary Search Tree
# Best Case (Balanced Tree): h = log2(n + 1) - 1
balanced_height = log2(n + 1) - 1

# Worst Case (Unbalanced Tree): h = n - 1
unbalanced_height = n - 1

# Time Complexity for Operations
# Average Case: O(log n) - Assumes the tree is balanced
# Worst Case: O(n) - Occurs when the tree is completely unbalanced
average_case_time = "O(log n)"
worst_case_time = "O(n)"

# Number of Nodes in a Full or Complete Binary Tree
n = 2^(h + 1) - 1

# Number of Leaf Nodes in a Full Binary Tree
L = 2^h
```

</details>

### AVL Tree

An AVL tree defined as a self-balancing Binary Search Tree (BST) where the difference between heights of left and right subtrees for any node cannot be more than one.

The difference between the heights of the left subtree and the right subtree for any node is known as the **balance factor** of the node.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20221229121830/avl.png" />

- **Height Balance**: AVL trees maintain height balance by ensuring the balance factor of every node is within -1 to 1.
- **Balance Factor**: This is calculated as the difference between the heights of the left and right subtrees.
- **Maintaining Balance**: Insertions and deletions might disrupt the balance, requiring rotations to restore it.

Benefits of AVL Trees:
- Guaranteed O(log n) Time Complexity: Since AVL trees maintain balance, the height of the tree is kept at O(log n), ensuring that operations like search, insert, and delete are performed in O(log n) time.
- Self-Balancing: AVL trees automatically adjust after operations, making them efficient for use in scenarios where frequent insertions and deletions occur.

<details>
  <summary>Formulas</summary>

```plaintext
# Key Formulas for AVL Trees

# 1. Balance Factor of a Node
# Balance Factor = Height of Left Subtree - Height of Right Subtree
# AVL Tree Property: Balance Factor should be -1, 0, or 1

# 2. Height of a Node
# Height of a Node = 1 + max(Height of Left Subtree, Height of Right Subtree)
# For a leaf node, height is 0

# 3. Height after Rotation
# Right Rotation (RR)
# New Height of Rotated Node = 1 + max(Height of Left Subtree, Height of Right Subtree)

# Left Rotation (LL)
# New Height of Rotated Node = 1 + max(Height of Left Subtree, Height of Right Subtree)

# Left-Right Rotation (LR)
# Combination of Left Rotation and Right Rotation

# Right-Left Rotation (RL)
# Combination of Right Rotation and Left Rotation
```

</details>

### Red-Black Tree

Red Black Trees are a type of balanced binary search tree that use a set of rules to maintain balance, ensuring logarithmic time complexity for operations like insertion, deletion, and searching, regardless of the initial shape of the tree. Red Black Trees are self-balancing, using a simple color-coding scheme to adjust the tree after each modification.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240520123005/Red-black-Tree-banner.webp" />

<details>
  <summary>Formulas</summary>

```plaintext
# Key Formulas and Properties for Red-Black Trees

# 1. Red-Black Tree Properties
# - Binary Search Tree Property
# - Color Property: Each node is either Red or Black
# - Root Property: Root node is always Black
# - Red Property: No two adjacent Red nodes
# - Black Height Property: All paths from a node to its leaves have the same number of Black nodes

# 2. Height
# - The height of a Red-Black Tree is O(log n)
# - This is because the longest path (from root to leaf) is at most twice the length of the shortest path

# 3. Black Height
# - Black Height is the number of Black nodes from the root to any leaf (excluding the leaf itself)

# 4. Rotations
# - Right Rotation: Used to fix left-heavy imbalances
# - Left Rotation: Used to fix right-heavy imbalances
```

</details>

### B-Tree

A B-Tree is a self-balancing tree data structure commonly used in databases and file systems to manage large amounts of sorted data efficiently. It is designed to allow for fast data retrieval, insertion, and deletion while keeping the tree balanced.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20200506235136/output253.png" />

<details>
  <summary>Formulas</summary>

```plaintext
# Key Formulas and Properties for B-Trees

# 1. B-Tree Properties
# - Balanced Tree: All leaf nodes are at the same depth
# - Degree (t): Defines the minimum and maximum number of keys and children
#   - Minimum number of keys per node: t - 1
#   - Maximum number of keys per node: 2t - 1
#   - Minimum number of children per node: t
#   - Maximum number of children per node: 2t

# 2. Node Capacity
# - Each internal node with k keys has k + 1 children

# 3. Root Node
# - The root node must have at least one key unless the tree is empty

# 4. Height
# - The height of a B-Tree is O(log_t(n)), where n is the number of keys
# - This ensures that operations (search, insert, delete) are efficient

# 5. Insertion
# - If a node becomes full (2t - 1 keys), it splits into two nodes
# - The middle key is promoted to the parent node

# 6. Deletion
# - If a node has fewer than t - 1 keys, it may borrow from or merge with siblings

```

</details>

### B-Tree+

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240217104748/1.png" />

_Source [here](https://www.geeksforgeeks.org/introduction-of-b-tree/)_

B-Tree+ (often referred to as B+ Tree) is a variant of the B-Tree that is used extensively in databases and file systems. It’s designed to enhance the efficiency of operations like searching, insertion, and deletion. Here's a simple explanation of B+ Trees and their key features:

1. Structure:
- Internal Nodes: Only store keys and act as routing nodes to guide the search process.
- Leaf Nodes: Store both keys and actual data (or pointers to data). Leaf nodes are linked together in a sorted order for efficient range queries.

2. Leaf Nodes:
- Linked List: All leaf nodes are connected in a linked list, making range queries (e.g., finding all records between two values) very efficient. This is because you can easily traverse the leaf nodes sequentially.

3. All Keys in Leaves:
- Keys: All keys are stored in the leaf nodes, not in the internal nodes. Internal nodes only contain keys to help navigate to the correct leaf node.

4. Balanced Tree:
- Like B-Trees, B+ Trees are also balanced. This means all leaf nodes are at the same level, ensuring that the tree remains balanced and operations are efficient.

<details>
  <summary>Formulas</summary>

```plaintext
# Key Formulas and Properties for B+ Trees

# 1. Degree (t)
# - Minimum number of keys per internal node: t - 1
# - Maximum number of keys per internal node: 2t - 1
# - Minimum number of children per internal node: t
# - Maximum number of children per internal node: 2t

# 2. Leaf Nodes
# - Leaf nodes contain all the keys and actual data.
# - Leaf nodes are linked in a sorted order for efficient range queries.

# 3. Tree Height
# - The height of a B+ Tree is O(log_t(n)), where n is the number of keys.
# - This ensures that search, insertion, and deletion operations are efficient.

# 4. Splitting and Promotion
# - When an internal node becomes full (2t - 1 keys), it splits into two nodes.
# - The middle key is promoted to the parent node.

# 5. Range Queries
# - Efficient range queries are facilitated by the linked list of leaf nodes.
# - Traverse the linked leaf nodes
```

</details>

### Segment Tree

Segment Tree is a versatile data structure used in computer science and data structures that allows efficient querying and updating of intervals or segments of an array. It is particularly useful for problems involving range queries, such as finding the sum, minimum, maximum, or any other operation over a specific range of elements in an array. The tree is built recursively by dividing the array into segments until each segment represents a single element. This structure enables fast query and update operations with a time complexity of O(log n), making it a powerful tool in algorithm design and optimization.

<img src="https://media.geeksforgeeks.org/wp-content/uploads/20240226171857/Segment-Tree-(1).webp" />

<details>
  <summary>Formulas</summary>

```plaintext
# Key Formulas and Properties for Segment Trees

# 1. Tree Construction
# - Build Time: O(n) where n is the number of elements in the array.

# 2. Query Operation
# - Time Complexity: O(log n)
# - Used to find the result (e.g., sum, minimum, maximum) over a specific range.

# 3. Update Operation
# - Time Complexity: O(log n)
# - Used to update a single element and propagate the change through the tree.

# 4. Tree Size
# - A segment tree has at most 4n nodes, where n is the number of elements in the array.

# 5. Node Representation
# - Leaf Nodes: Represent individual elements of the array.
# - Internal Nodes: Represent the aggregation (sum, minimum, maximum, etc.) of their child nodes.

# Example:
# For array [1, 3, 5, 7, 9, 11]:
# - Leaf Nodes: [1], [3], [5], [7], [9], [11]
# - Internal Nodes represent sums of segments:
#   - Example Internal Node: [9] represents sum of [1, 3, 5]
#   - Example Internal Node: [27] represents sum of [7, 9, 11]
```

</details>
