//
//  ViewController.swift
//  Calculadora
//
//  Created by Efraim Torres on 15/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var previusNumber: Double = 0
    var numberOnScreen: Double = 0
    var operatorSelected: Int = 0
    var operatorWasPressed: Bool = false
    var habEqual: Bool = false
    
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        
        var clickedNumber: String = "\(sender.tag)"
        var hasPoint: Bool = false
        
        hasPoint = answer.text!.contains(".")
        
        if sender.tag == 18 && hasPoint == false {
            if answer.text == "0" {
                clickedNumber = "0."
            } else {
                clickedNumber = "."
            }
        }
            
            if sender.tag == 18 && hasPoint == true {
                return
            }
            
            if answer.text == "0" || operatorWasPressed == true {
                answer.text = clickedNumber
                operatorWasPressed = false
            } else {
                answer.text = answer.text! + clickedNumber
            }
            
            numberOnScreen = Double(answer.text!)!
            
        }
        
        @IBAction func operatorPressed(_ sender: UIButton) {
            
            let clickedOperator: Int = sender.tag
            
            if clickedOperator == 10 {
                answer.text = "0"
                
            } else if clickedOperator == 11 {
                
                answer.text = String(numberOnScreen*(-1))
                numberOnScreen = Double(answer.text!)!
                
            } else if clickedOperator == 12 {
                
                answer.text = String(numberOnScreen/100)
                numberOnScreen = Double(answer.text!)!
                
            } else if answer.text != "0" {
                operatorSelected = clickedOperator
                previusNumber = Double(answer.text!)!
                operatorWasPressed = true
                habEqual = true
            }
        }
        
        
        @IBAction func equalPressed(_ sender: UIButton) {
            
            if habEqual == true {
                
                var numberCalculated: Double = 0
                
                switch operatorSelected {
                    
                    // divide
                case 13:
                    numberCalculated = previusNumber/numberOnScreen
                    
                    // multiply
                case 14:
                    numberCalculated = previusNumber*numberOnScreen
                    
                    // minus
                case 15:
                    numberCalculated = previusNumber-numberOnScreen
                    
                    // plus
                case 16:
                    numberCalculated = previusNumber+numberOnScreen
                    
                default:
                    print ("Nothing")
                }
                
                answer.text = String(numberCalculated)
                numberOnScreen = Double(answer.text!)!
                previusNumber = 0
                habEqual = false
                
            }
        }
        
    }

