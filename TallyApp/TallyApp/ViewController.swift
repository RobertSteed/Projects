//
//  ViewController.swift
//  TallyApp
//
//  Created by Robert Steed on 9/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    //PROPERTIES UP HERE
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var stepAmountField: UITextField!
    
    //LIFE CYCLE EVENTS AND INIT HERE
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //NORMAL FUNCTIONS HERE
    
    //IBACTIONS HERE
    @IBAction func clearTotal(_ sender: UIButton) {
        totalLabel.text = "0"
    }
    
    
    @IBAction func Add(_ sender: UIButton) {
        var currentStepAmount = 1
        
        if let currentStepAmountText = stepAmountField.text, let currentStepAmountLocal = Int(currentStepAmountText) {
            currentStepAmount = currentStepAmountLocal
        }
        
        
        
        if let currentValueText = totalLabel.text, let currentValue = Int(currentValueText) {
            totalLabel.text = "\(currentValue + currentStepAmount)"
            
        } else {
            
            totalLabel.text = "\(currentStepAmount)"
        }
    }
    
    @IBAction func subtract(_ sender: UIButton) {
      guard let currentStepAmountText = stepAmountField.text, let currentStepAmount = Int(currentStepAmountText) else { return }
        
        if let currentValueText = totalLabel.text, let currentValue = Int(currentValueText) {
            totalLabel.text = "\(currentValue - currentStepAmount)"
            
        } else {
    
            totalLabel.text = "\(currentStepAmount)"
        }
    }
}

//do a text box
// set the add and subtract buttons to the input of the text box
//or do a segmented control maybe at the bottom


//
