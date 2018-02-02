//
//  ViewController.swift
//  sorting_iOS
//
//  Created by Seoyeong Heo on 2018. 2. 2..
//  Copyright © 2018년 Seoyeong Heo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var number = [5, 9, 3, 6, 8, 4, 1, 2, 7]
    var sortedNumber: [Int] = []
    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var numberLabel: [UILabel]!
    var index = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    func numberKeypad(numA: Int) {
        if index == 8 {
            return
        }
        index += 1
        number[index] = numA
        numberLabel[index].text = "\(numA)"
        viewWillAppear(false)
    }
    
    @IBAction func handlerOne(_ sender: Any) {
        numberKeypad(numA: 1)
    }
    
    @IBAction func handlerTwo(_ sender: Any) {
        numberKeypad(numA: 2)
    }
    
    @IBAction func handlerThree(_ sender: Any) {
        numberKeypad(numA: 3)
    }
    
    @IBAction func handlerFour(_ sender: Any) {
        numberKeypad(numA: 4)
    }
    
    @IBAction func handlerFive(_ sender: Any) {
        numberKeypad(numA: 5)
    }
    
    @IBAction func handlerSix(_ sender: Any) {
        numberKeypad(numA: 6)
    }
    
    @IBAction func handlerSeven(_ sender: Any) {
        numberKeypad(numA: 7)
    }
    
    @IBAction func handlerEight(_ sender: Any) {
        numberKeypad(numA: 8)
    }
    
    @IBAction func handlerNine(_ sender: Any) {
        numberKeypad(numA: 9)
    }
    
    func compareNum(indexA: Int, indexB: Int) {
        if sortedNumber[indexA] > sortedNumber[indexB] {
            let tmp = sortedNumber[indexA]
            sortedNumber[indexA] = sortedNumber[indexB]
            sortedNumber[indexB] = tmp
        }
    }

    @IBAction func handlerBubble(_ sender: Any) {
        sortedNumber = number
        for i in 0..<sortedNumber.count {
            let indexA = sortedNumber.count - i
            for j in 1..<indexA {
                let indexB = j
                compareNum(indexA: indexB-1, indexB: indexB)
            }
        }
        print("number : \(number)")
        print("Bubble Sort : \(sortedNumber)")
    }
    
    @IBAction func handlerSelection(_ sender: Any) {
        sortedNumber = number
        for i in 0..<sortedNumber.count {
            let indexA = sortedNumber.count - i
            var min = 0
            for j in 1..<indexA {
                let indexB = j
                if sortedNumber[indexB] > sortedNumber[min] {
                    min = indexB
                }
            }
            compareNum(indexA: min, indexB: indexA-1)
        }
        print("Selection Sort : \(sortedNumber)")
    }
    
    @IBAction func handlerInsertion(_ sender: Any) {
        sortedNumber = number
        for i in 1..<sortedNumber.count {
            let indexA = i
            for j in 0..<indexA {
                let indexB = indexA - j
                if sortedNumber[indexB-1] > sortedNumber[indexB] {
                    let tmp = sortedNumber[indexB-1]
                    sortedNumber[indexB-1] = sortedNumber[indexB]
                    sortedNumber[indexB] = tmp
                } else {
                    break
                }
            }
        }
        print("Insertion Sort : \(sortedNumber)")
    }
    
    @IBAction func handlerMerge(_ sender: Any) {
        sortedNumber = number
        sortedNumber = mergeSort(array: sortedNumber)
        print("Merge Sort : \(sortedNumber)")
    }
    
    func mergeSort(array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
        
        return merge(left: leftArray, right: rightArray)
    }
    
    func merge(left: [Int], right: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var orderedArray: [Int] = []
        
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            if leftElement < rightElement {
                orderedArray.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                orderedArray.append(rightElement)
                rightIndex += 1
            } else {
                orderedArray.append(leftElement)
                leftIndex += 1
                orderedArray.append(rightElement)
                rightIndex += 1
            }
        }
        
        while leftIndex < left.count {
            orderedArray.append(left[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < right.count {
            orderedArray.append(right[rightIndex])
            rightIndex += 1
        }
        
        return orderedArray
    }
    
    
    @IBAction func handlerHeap(_ sender: Any) {
    }
    
    @IBAction func handlerQuick(_ sender: Any) {
        sortedNumber = number
        sortedNumber = quicksort(array: sortedNumber)
        print("Quick Sort : \(sortedNumber)")
    }
    
    func quicksort(array: [Int]) -> [Int] {
        
        if array.count <= 1 {
            return array
        }
        
        let pivot = array[array.count/2]
        
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        return quicksort(array: less) + equal + quicksort(array: greater)
    }
}

