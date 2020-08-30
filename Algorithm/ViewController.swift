//
//  ViewController.swift
//  Algorithm
//
//  Created by MC on 2020/8/9.
//  Copyright © 2020 聂康. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        buddlingSortCase()
//        kNode()
    }
    
    func buddlingSortCase()  {
//        var arr = [5, 7, 3, 29, 10, 15]
       var arr = [5, 8,10,7, 3, 29, 10, 15]

        
//        var arr = [15, 7, 3, 99, 10, 2, 15, 3, 9]
//        print(bubblingASCSort(&arr))
//        print(bubblingDescSort(&arr))
//        print(selectSort(&arr))
//        print(insertSort(&arr))
//        print(quickSort(&arr, l: 0, r: arr.count-1))
//        print(heapSort(&arr, length: arr.count))

//        print(countSort(&arr))
        
//        print(mergeSort(arr))
        print(shellSort(&arr))

    }
    
    func kNode() {
         let node1 = Node(10)
         let node2 = Node(5)
         let node3 = Node(12)
         let node4 = Node(4)
         let node5 = Node(7)

         node1.next = node2
         node2.next = node3
         node3.next = node4
         node4.next = node5
        
        printReverseNode(node: node1)
            
//        print(findSufix(node: node1, k: 2)?.value ?? 0)
    }
    
    func nodePathsCase()  {
        let node1 = TreeNode(10)
        let node2 = TreeNode(5)
        let node3 = TreeNode(12)
        let node4 = TreeNode(4)
        let node5 = TreeNode(7)

        node1.left = node2
        node1.right = node3
        node2.left = node4
        node2.right = node5
       
        print(getPaths(rootNode: node1, target: 22))
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 计算深度
//        TreeNode.testMaxDepth()
        // 计算节点数
        print(TreeNode.testCount())
    }

}


