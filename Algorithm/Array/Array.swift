//
//  Array.swift
//  Algorithm
//
//  Created by 聂康 on 2020/8/12.
//  Copyright © 2020 聂康. All rights reserved.
//

import Foundation

// 冒泡排序-升序
func bubblingASCSort(_ array: inout [Int]) -> [Int] {
    for i in 0..<array.count-1 {
        for j in 0..<array.count-i-1 {
            if array[j] > array[j+1] {
                let tmp = array[j+1]
                array[j+1] = array[j]
                array[j] = tmp
            }
        }
    }
    return array;
}

// 选择排序
func selectSort(_ array: inout [Int]) -> [Int] {
    var index = 0
    var tmp = 0
    for i in 0..<array.count {
        index = i
        for j in i+1..<array.count {
            if array[i] > array[j] {
                index = j
            }
        }
        tmp = array[i]
        array[i] = array[index]
        array[index] = tmp
    }
    return array
}

// 插入排序
func insertSort(_ array: inout [Int]) -> [Int] {
    var preIndex = 0
    var current = 0
    for i in 1..<array.count {
        preIndex = i - 1
        current = array[i]
        while preIndex >= 0 && array[preIndex] > current{
            array[preIndex+1] = array[preIndex]
            preIndex = preIndex - 1
        }
        array[preIndex+1] = current
    }
    return array
}

// 快速排序

@discardableResult
func quickSort(_ array: inout [Int], l: Int, r: Int) -> [Int] {
    if l < r {
        var i = l, j = r
        let x = array[i]
        while i < j {
            // 从右向左
            while i < j && array[j] >= x{
                j = j - 1
            }
            if i < j {
                array[i] = array[j]
                i = i + 1
            }
            
            // 从左向右
            while i < j && array[i] < x {
                i = i + 1
            }
            if i < j {
                array[j] = array[i]
                j = j - 1
            }
        }
        array[i] = x
        quickSort(&array, l: l, r: i-1)
        quickSort(&array, l: i + 1, r: r)
    }
    
    return array
}
