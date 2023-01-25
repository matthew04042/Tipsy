//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Matthew Cheung on 25/1/2023.
//

import UIKit

struct CalculatorBrain{
    var tips: Tips?
    var tipsPercentage: Float?
    
    mutating func getTips(_ tips: String){
        if tips == "0%"{
            tipsPercentage = 0.0
        }else if tips == "10%"{
            tipsPercentage = 0.1
        }else if tips == "20%" {
            tipsPercentage = 0.2
        }else{
            print("Something ran wrong")
        }
    }
    mutating func calculateTips(_ bill: Float, _ split: Int) {
        let tipsTotal = ((bill*(tipsPercentage ?? 0.1))+bill)/Float(split)
        tips = Tips(total: tipsTotal, setting: "Spilit between \(split) people, with \(Int((tipsPercentage ?? 0.1)*100))% tip.")
    }
    func getTotal() -> String {
        let totalAmount = String(format: "%.2f", tips?.total ?? 0.0)
        return totalAmount
    }
    func getSetting() -> String {
        return tips?.setting ?? "Somethin ran Wrong"
    }
    
}
