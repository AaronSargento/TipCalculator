//
//  ThirdViewController.swift
//  Homework 2
//
//  Created by Aaron Sargento on 1/25/17.
//  Copyright © 2017 Aaron Sargento. All rights reserved.
//

// Input: User will enter the subtotal via text field, and the tax and tip via sliders.
// Output: Program will continually display the total as the user changes the value of the input. A blank text field equates to 0.

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UISlider!
    
    @IBOutlet weak var input3: UISlider!
    
    @IBOutlet weak var ViewTitle: UILabel!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var output: UILabel!
    
    var decision: Int = 0
    
    //hold our input values
    var s1: String = ""
    var s2: Double = 0.0
    var s3: Double = 0.0
    
    /*
     This function will take the string from the text field and call calculateTotal() to calculate the running total
    */
    @IBAction func subtotalBox(_ sender: UITextField) {
        s1 = input1.text!
        calculateTotal()
    }
    
    /*
     This function will take the value from each slider and call calculateTotal() to calculate the running total
     */
    @IBAction func slider(_ sender: UISlider) {
        switch sender {
        case input2:
            self.s2 = Double(sender.value)
            taxLabel.text = "\(s2)"
        case input3:
            self.s3 = Double(sender.value)
            tipLabel.text = "\(s3)"
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
        if !s1.isEmpty {
            b1 = NSDecimalNumber(string: s1)
        }
        let tax = b1.multiplying(by: NSDecimalNumber(value: s2))
        let tip = b1.multiplying(by: NSDecimalNumber(value: s3))
        let c1 = b1.adding(tip)
        let c2 = c1.adding(tax)
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
        
        //add flexibleSpace and Done button to toolbar
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        //add toolbar to numberpad
        input1.inputAccessoryView = toolbar
        
        //add decimal point to numberpad
        input1.keyboardType = UIKeyboardType.decimalPad
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
        // Do any additional setup after loading the view.
        
        editKeyboard() //add a Decimal button and a Done button
        
        //round out the edges of our labels
        roundLabels(label: ViewTitle)
        roundLabels(label: taxLabel)
        roundLabels(label: tipLabel)
        roundLabels(label: output)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
