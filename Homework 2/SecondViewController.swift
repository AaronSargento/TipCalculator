//
//  SecondViewController.swift
//  Homework 2
//
//  Created by Aaron Sargento on 1/23/17.
//  Copyright © 2017 Aaron Sargento. All rights reserved.
//

// Input: User will enter the subtotal, tax, and tip via text fields
// Output: Program will continually display the total as the user changes the values of the input. A blank text field equates to 0.

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UITextField!
    
    @IBOutlet weak var input3: UITextField!
    
    @IBOutlet weak var ViewTitle: UILabel!
    
    @IBOutlet weak var output: UILabel!
    
    //hold our input values
    var s1: String = ""
    var s2: String = ""
    var s3: String = ""
    
    /*
        This function will take the string from each text field and call calculateTotal() to calculate the running total
    */
    @IBAction func textBox(_ sender: UITextField) {
        switch sender {
        case input1:
            self.s1 = sender.text!
        case input2:
            self.s2 = sender.text!
        case input3:
            self.s3 = sender.text!
        default:
            break
        }
        calculateTotal()
    }
    
    /*
        This function will calculate and print the running total based on the current value of the inputs
    */
    func calculateTotal() {
        var b1 = NSDecimalNumber(value: 0.0)
        var b2 = NSDecimalNumber(value: 0.0)
        var b3 = NSDecimalNumber(value: 0.0)
        if !s1.isEmpty {
            b1 = NSDecimalNumber(string: s1)
        }
        if !s2.isEmpty {
            b2 = NSDecimalNumber(string: s2)
        }
        if !s3.isEmpty {
            b3 = NSDecimalNumber(string: s3)
        }
        let tax = b1.multiplying(by: b2)
        let tip = b1.multiplying(by: b3)
        let c1 = b1.adding(tax)
        let c2 = c1.adding(tip)
        output.text = NumberFormatter.localizedString(from: c2, number: .currency)
    }
    
    /*
        This function will add a Done button to the toolbar that will be attached to a numberpad
        It will also add a flexibleSpace to have the Done button align to the far right
        Lastly it will add a Decimal button to the numberpad
    */
    func editKeyboard() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil) //set flexibleSpace for Done button
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked)) //set Done button
        
        //add flexibleSpace and Done Button to toolbar
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        //add toolbar to each numberpad
        input1.inputAccessoryView = toolbar
        input2.inputAccessoryView = toolbar
        input3.inputAccessoryView = toolbar
        
        //add decimal point to each numberpad
        input1.keyboardType = UIKeyboardType.decimalPad
        input2.keyboardType = UIKeyboardType.decimalPad
        input3.keyboardType = UIKeyboardType.decimalPad
    }
    
    /*
        This function will have the toolbar close after clicking Done button
    */
    func doneClicked() {
        view.endEditing(true)
    }
    
    /*
        This function will curve the label borders
    */
    func roundLabels(label: UILabel) {
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        editKeyboard() //add a Done button and a Decimal button
        
        //round the labels
        roundLabels(label: ViewTitle)
        roundLabels(label: output)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

