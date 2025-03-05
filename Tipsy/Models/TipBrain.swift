//
//  Model.swift
//  Tipsy
//
//  Created by Ádám Marton on 05.03.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit


struct TipBrain {
    var numberOfPeople: Int = 2
    var tipPercentage: Float = 0
    var billAmount: Float = 0
    var totalAmount: Float = 0
    var tipAmount: Float {
        return billAmount / Float(numberOfPeople) * tipPercentage
    }
    
    mutating func getTipPercentage(percentage: Float) {
        tipPercentage = percentage
    }
    
    mutating func getBillAmount(amount: Float) {
        billAmount = amount
    }
    
    mutating func getNumberOfPeople(people: String) {
        numberOfPeople = Int(people) ?? 2
    }
    
    var total: Float {
        return billAmount / Float(numberOfPeople) + tipAmount
    }
}
