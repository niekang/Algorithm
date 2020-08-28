//
//  String.swift
//  Algorithm
//
//  Created by MC on 2020/8/17.
//  Copyright © 2020 聂康. All rights reserved.
//

import Foundation

// 字符串所有字符是否不重复
extension String {
    func uniqueCharcaters() -> Bool {
        var dict: [Character: Int] = [:]
        for c in self {
            if dict[c] != nil{
                return false
            }
            dict[c] = 1
        }
        return true
    }
}
