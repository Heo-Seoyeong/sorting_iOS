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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        print("Bubble Sort : \(sortedNumber)")
    }
    
    @IBAction func handlerSelection(_ sender: Any) {
        sortedNumber = number
        for i in 0..<sortedNumber.count {
            let indexA = sortedNumber.count - i
            var max = 0
            for j in 1..<indexA {
                let indexB = j
                if sortedNumber[indexB] > sortedNumber[max] {
                    max = indexB
                }
            }
            compareNum(indexA: max, indexB: indexA-1)
        }
        print("Selection Sort : \(sortedNumber)")
    }
    
    @IBAction func handlerInsertion(_ sender: Any) {
    }
    
    @IBAction func handlerMerge(_ sender: Any) {
    }
    
    @IBAction func handlerHeap(_ sender: Any) {
    }
    
    @IBAction func handlerQuick(_ sender: Any) {
    }
}

