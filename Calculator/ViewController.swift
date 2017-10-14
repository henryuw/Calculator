//
//  ViewController.swift
//  Calculator
//
//  Created by Henry Zhu on 9/24/17.
//  Copyright © 2017 Henry Zhu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingOperator = false
    var operation = 0;
    var dataObject: String = ""
    
    @IBOutlet weak var Outputs: UILabel!
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingOperator == true{
            Outputs.text = String(sender.tag-1)
            numberOnScreen = Double(Outputs.text!)!
            performingOperator = false
        }else{
            Outputs.text = Outputs.text! + String(sender.tag-1)
            numberOnScreen = Double(Outputs.text!)!
        }
    }
    
    @IBAction func operators(_ sender: UIButton) {
        if Outputs.text != "" && sender.tag != 11 && (sender.tag != 19)
        {
            previousNumber = Double(Outputs.text!)!
            if sender.tag == 18
            {
                Outputs.text = String(Int(numberOnScreen))+"/";
                //Outputs.text =  Outputs.text.append("/");
            }
            else if sender.tag == 17
            {
                Outputs.text = String(Int(numberOnScreen))+"x";
            }
            else if sender.tag == 16
            {
                Outputs.text=String(Int(numberOnScreen))+"-";
            }
            else if sender.tag == 15
            {
                Outputs.text = String(Int(numberOnScreen))+"+";
            }
            operation = sender.tag
            performingOperator = true;
        }else if sender.tag == 20{
            //Outputs.text = String(numberOnScreen) + "."
        }
        else if sender.tag == 19
        {
            if operation == 18
            {
                Outputs.text = String(previousNumber / numberOnScreen)

            }
            else if operation == 17
            {
                Outputs.text = String(previousNumber * numberOnScreen)

            }
            else if operation == 16
            {
                Outputs.text = String(previousNumber - numberOnScreen)

            }
            else if operation == 15
            {
                Outputs.text = String(previousNumber + numberOnScreen)
            }
        }
        else if sender.tag == 11
        {
            Outputs.text = ""
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

