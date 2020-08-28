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
        buddlingSortCase()
    }
    
    func buddlingSortCase()  {
        var arr = [5, 7, 3, 29, 10, 15]
        
        
//        print(bubblingASCSort(&arr))
//        print(bubblingDescSort(&arr))
//        print(selectSort(&arr))
//        print(insertSort(&arr))
        print(quickSort(&arr, l: 0, r: arr.count-1))

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
        TreeNode.testMaxDepth()
        //
        print("saas".uniqueCharcaters())
        print("sab4".uniqueCharcaters())
    }

}


