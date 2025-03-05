//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Ádám Marton on 05.03.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var result: Float?
    var numberOfPeople: Int?
    var tipPercentage: Float?

    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = "\(String(format: "%.2f", result ?? 0))"
        settingsLabel.text = "Split between \(numberOfPeople ?? 0) people with a tip of \(String(format: "%.0f", (tipPercentage ?? 0) * 100))%"
    }
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
