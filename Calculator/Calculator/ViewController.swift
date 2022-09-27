//
//  ViewController.swift
//  Calculator
//
//  Created by Robert Steed on 9/18/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var total: UILabel!
    var operandType = ""
    var firstNum = ""
    var secondNum = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        total.text = ""
    }

    @IBAction func clearInput(_ sender: Any) {
        total.text = ""
     }
    
    @IBAction func enter(_ sender: Any) {
        secondNum = total.text!
        
        let doubledFirstNum = Double(firstNum)
        let doubledSecondNum = Double(secondNum)
        guard let localFirstNum = doubledFirstNum else {return}
        guard let localSecondNum = doubledSecondNum else {return}
        
        switch operandType {
        case "+":
            
            total.text = String(localFirstNum + localSecondNum)
        case "-":
            total.text = String(localFirstNum - localSecondNum)
        case "*":
            total.text = String(localFirstNum * localSecondNum)
        case "/":
            total.text = String(localFirstNum / localSecondNum)
        default:
            total.text = ""
        }
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        
        
        total.text = (total.text ?? "") + title
    }
    
    @IBAction func operandTapped(_ button: UIButton) {
        guard let title = button.titleLabel else { return }
        
        firstNum = total.text!
        total.text = ""

        switch title.text {
        case "+":
            operandType = "+"
        case "-":
            operandType = "-"
        case "*":
            operandType = "*"
        case "/":
            operandType = "/"
        default:
            operandType = ""
        }
            
        }
    

    
   
    }
    
        
    
    
    
    
    




// how to put functionality in my enter button
// how to write my switch statement for the operands
// write another function that actually performs the math then call it in the switch statement?
