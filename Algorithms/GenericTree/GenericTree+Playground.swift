//
//  GenericTree+Playground.swift
//  Algorithms
//
//  Created by Radu Dan on 18.08.2024.
//

extension GenericTreeNode: Playground {
    static func executeOperations() {
        typealias TreeNode = GenericTreeNode<String>
        let root = TreeNode(data: "A")

        let nodeB = TreeNode(data: "B")
        let nodeC = TreeNode(data: "C")
        let nodeD = TreeNode(data: "D")

        root.addChild(nodeB)
        root.addChild(nodeC)
        root.addChild(nodeD)

        let nodeE = TreeNode(data: "E")
        let nodeF = TreeNode(data: "F")

        nodeB.addChild(nodeE)
        nodeB.addChild(nodeF)

        let nodeG = TreeNode(data: "G")
        let nodeH = TreeNode(data: "H")

        nodeC.addChild(nodeG)
        nodeC.addChild(nodeH)

        root.traverseByLevelViaQueue()
    }
}
