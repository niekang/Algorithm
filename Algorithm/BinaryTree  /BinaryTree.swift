//
//  BinaryTree  .swift
//  Algorithm
//
//  Created by MC on 2020/8/9.
//  Copyright © 2020 聂康. All rights reserved.
//

import Foundation

// 求二叉树的最大深度

class TreeNode {
    var value: Int?
    var left: TreeNode?
    var right: TreeNode?
    init(_ value: Int) {
        self.value = value
    }
}

func maxDepth(_ node: TreeNode?) -> Int {
    if node == nil {
        return 0
    }
    return 1 + max(maxDepth(node?.left), maxDepth(node?.right))
}

extension TreeNode {
    // 测试案例
    class func testMaxDepth() {
        var depth = 1
        let rootNode = TreeNode(depth)
        var nodes = [rootNode]
        var lastNodes = [TreeNode]()
        // 测试深度最多50
        while nodes.count != 0 && depth < 50{
            var children = [TreeNode]();
            nodes.forEach { (node) in
                if(arc4random()%2 == 0){
                    node.left = TreeNode(depth+1)
                    children.append(node.left!)
                }
                if(arc4random()%2 == 0){
                    node.right = TreeNode(depth+1)
                    children.append(node.right!)
                }
            }
            if children.count > 0 {
                depth += 1;
            }
            lastNodes = nodes
            nodes = children
        }
        print("最后一个孩子节点\(lastNodes.last!.value!)")
        print("实际深度：\(depth) -- 计算深度：\(maxDepth(rootNode))")
    }


}



