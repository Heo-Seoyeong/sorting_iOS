//
//  ViewController.swift
//  sorting_iOS
//
//  Created by Seoyeong Heo on 2018. 2. 2..
//  Copyright © 2018년 Seoyeong Heo. All rights reserved.
//

import UIKit

// View Cycle
class MainViewController: UIViewController {

    @IBOutlet var numberButton: [UIButton]!
    @IBOutlet var numberLabel: [UILabel]!
    
    var number = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var sortedNumber: [Int] = []
    var index = -1
    var sortingName = "Not Sorting"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\(sortingName) : \(number)")
    }
   
}

// 숫자 패드 입력
extension MainViewController {
    
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
    
}

// sort 버튼
extension MainViewController {
    
    func compareNum(indexA: Int, indexB: Int) {
        if sortedNumber[indexA] > sortedNumber[indexB] {
            let tmp = sortedNumber[indexA]
            sortedNumber[indexA] = sortedNumber[indexB]
            sortedNumber[indexB] = tmp
        }
    }
    
    @IBAction func handlerBubble(_ sender: Any) {
        sortingName = "Bubble"
        for i in 0..<number.count {
            let indexA = number.count - i
            for j in 1..<indexA {
                let indexB = j
                if number[indexB-1] > number[indexB] {
                    let tmp = number[indexB-1]
                    number[indexB-1] = number[indexB]
                    number[indexB] = tmp
                    numberLabel[indexB-1].text = "\(number[indexB-1])"
                    numberLabel[indexB].text = "\(number[indexB])"
                    viewWillAppear(false)
                }
            }
        }
    }
    
    @IBAction func handlerSelection(_ sender: Any) {
        sortingName = "Selection"
        sortedNumber = number
        for i in 0..<number.count {
            let indexA = number.count - i
            var min = 0
            for j in 1..<indexA {
                let indexB = j
                if number[indexB] > number[min] {
                    min = indexB
                }
            }
            
            if number[min] > number[indexA-1] {
                let tmp = number[min]
                number[min] = number[indexA-1]
                number[indexA-1] = tmp
                
                numberLabel[min].text = "\(number[min])"
                numberLabel[indexA-1].text = "\(number[indexA-1])"
                viewWillAppear(false)
            }
        }
    }
    
    @IBAction func handlerInsertion(_ sender: Any) {
        sortingName = "Insertion"
        for i in 1..<number.count {
            let indexA = i
            for j in 0..<indexA {
                let indexB = indexA - j
                if number[indexB-1] > number[indexB] {
                    let tmp = number[indexB-1]
                    number[indexB-1] = number[indexB]
                    number[indexB] = tmp
                    numberLabel[indexB-1].text = "\(number[indexB-1])"
                    numberLabel[indexB].text = "\(number[indexB])"
                    viewWillAppear(false)
                } else {
                    break
                }
            }
        }
    }
    
    @IBAction func handlerMerge(_ sender: Any) {
        sortingName = "Merge"
        sortedNumber = number
        number = mergeSort(array: sortedNumber)
        for num in 0..<number.count {
            numberLabel[num].text = "\(number[num])"
        }
    }
    
    func mergeSort(array: [Int]) -> [Int] {
        if array.count <= 1 {
            return array
        }
        
        let middleIndex = array.count / 2
        let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
        let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
        
        number = merge(left: leftArray, right: rightArray)
        viewWillAppear(false)
        
        return number
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
        sortingName = "Quick"
        sortedNumber = number
        number = quicksort(array: sortedNumber)
    }
    
    func quicksort(array: [Int]) -> [Int] {
        
        if array.count <= 1 {
            return array
        }
        
        let pivot = array[array.count/2]
        
        let less = array.filter { $0 < pivot }
        let equal = array.filter { $0 == pivot }
        let greater = array.filter { $0 > pivot }
        
        let arrayQuick = quicksort(array: less) + equal + quicksort(array: greater)
        number = arrayQuick
        for num in 0..<arrayQuick.count {
            numberLabel[num].text = "\(arrayQuick[num])"
        }
        viewWillAppear(false)
        
        return arrayQuick
    }
    
    @IBAction func handlerReset(_ sender: Any) {
        sortingName = "Not Sorting"
        index = -1
        for num in 0..<number.count {
            numberLabel[num].text = "0"
            number[num] = 0
        }

        viewWillAppear(false)
    }
}
