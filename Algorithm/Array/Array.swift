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
//var arr = [5, 7, 3, 29, 10, 15]

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
                j -= 1
            }
            if i < j {
                array[i] = array[j]
                i += 1
            }
            
            // 从左向右
            while i < j && array[i] < x {
                i += 1
            }
            if i < j {
                array[j] = array[i]
                j -= 1
            }
        }
        array[i] = x
        quickSort(&array, l: l, r: i-1)
        quickSort(&array, l: i + 1, r: r)
    }
    
    return array
}

// 堆排序
// 找到最后一个节点的父节点作为倒序遍历的第一个节点
// 比较父节点的左右节点与父节点的大小，交换数据
// 依次往上一个节点遍历
func heapSort(_ array: inout [Int], length: Int) -> [Int] {
    if length <= 1 {
        return array
    }
    for i in (0...length/2-1).reversed() {
        var largest = i
        let left = 2*i+1
        let right = 2*i+2
        if left < length && array[left] > array[largest]{
            largest = left
        }
        if right < length && array[right] > array[largest] {
            largest = right
        }
        if largest != i {
            let tmp = array[i]
            array[i] = array[largest]
            array[largest] = tmp
        }
    }
    
    let tmp = array[length-1]
    array[length-1] = array[0]
    array[0] = tmp
    
    return heapSort(&array, length: length-1)
}

// 计算排序
func countSort(_ array: inout [Int]) -> [Int] {
    // 先获取最大值
    var max = 0
    for number in array {
        if max < number {
            max = number
        }
    }
    
    // 创建新素组
    var countArr = Array.init(repeating: 0, count: max+1)
    // 填充array中数字出现的字数
    for number in array {
        countArr[number] = countArr[number] + 1
    }
    
    // 遍历输出结果
    var sortArr = Array.init(repeating: 0, count: array.count)
    var i = 0
    for (index, count) in countArr.enumerated() {
        for _ in 0..<count {
            sortArr[i] = index
            i = i + 1
        }
    }
    return sortArr
}

// 归并排序
func mergeSort(_ array: [Int]) -> [Int]  {
    guard array.count > 1 else {
        return array
    }
    let mid = array.count/2
    let left = mergeSort(Array(array[0..<mid]))
    let right = mergeSort(Array(array[mid..<array.count]))
    return merge(leftPile: left, rightPile: right)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var l = 0
    var r = 0

    var result = [Int]()
    while l < leftPile.count && r < rightPile.count {
        if leftPile[l] > rightPile[r] {
            result.append(rightPile[r])
            r += 1
        }else if leftPile[l] < rightPile[r] {
            result.append(leftPile[l])
            l += 1
        }else {
            result.append(leftPile[l])
            result.append(rightPile[r])
            l += 1
            r += 1
        }
    }

    while l < leftPile.count {
        result.append(leftPile[l])
        l += 1
    }
    
    while r < rightPile.count {
        result.append(rightPile[r])
        r += 1
    }
    
    return result
}


// 希尔排序
//var arr = [5, 7, 3, 29, 10, 15]
func shellSort(_ arr: inout [Int]) -> [Int] {
    
    let length = arr.count
    var interval = length/2
    while interval > 0 {
        for i in interval..<length {
            var index = i
            let current = arr[i]
            while index - interval >= 0 && arr[index-interval] > current {
                arr[index] = arr[index-interval]
                index -= interval
            }
            arr[index] = current
        }
        interval /= 2
    }
    return arr
}


// 二分查找
func find(arr: [Int], target:Int) -> Int {
    var left = 0
    var right = arr.count-1
    while left <= right {
        let mid = (left+right)/2
        if arr[mid] == target {
            return mid
        }else if arr[mid] > target {
            right = mid - 1
        }else if arr[mid] < target {
            left = mid + 1
        }
    }
    return -1
}

// 插值查找 4
var a = [1,3,5]
func insertFind(arr: [Int], target: Int, low: Int, high: Int) -> Int{
    let mid = low + (target-arr[low])/(arr[high]-arr[low])*(high-low)
    if mid < 0 || mid > arr.count {
        return -1
    }
    if arr[mid] == target {
        return mid
    }else if arr[mid] > target {
        return insertFind(arr: arr, target: target, low: low, high: mid-1)
    }else if arr[mid] < target {
        return insertFind(arr: arr, target: target, low: mid+1, high: high)
    }
    return -1
}
