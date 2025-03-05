//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var tipBrain = TipBrain()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value.rounded(.down))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tipBrain.getBillAmount(amount: Float(billTextField.text ?? "") ?? 0.0)
        tipBrain.getNumberOfPeople(people: splitNumberLabel.text!)
        
        if zeroPctButton.isSelected {
            tipBrain.getTipPercentage(percentage: 0.0)
        } else if tenPctButton.isSelected {
            tipBrain.getTipPercentage(percentage: 0.1)
        } else {
            tipBrain.getTipPercentage(percentage: 0.2)
        }
        self.performSegue(withIdentifier: "goToBill", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToBill" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.result = tipBrain.total
            destinationVC.numberOfPeople = tipBrain.numberOfPeople
            destinationVC.tipPercentage = tipBrain.tipPercentage
        }
        
    }
}
