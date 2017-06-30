//
//  ThirdViewController.swift
//  Homework 2
//
//  Created by Aaron Sargento on 1/25/17.
//  Copyright © 2017 Aaron Sargento. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var input1: UITextField!
    
    @IBOutlet weak var input2: UISlider!
    
    @IBOutlet weak var input3: UISlider!
    
    @IBOutlet weak var taxLabel: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var output: UILabel!
    
    //hold our values
    var s1: String = ""
    var s2: Double = 0.0
    var s3: Double = 0.0
    
    //take in the subtotal
    @IBAction func subtotalBox(_ sender: UITextField) {
        s1 = input1.text!
        calculateTotal()
    }
    
    //take in the tax
    @IBAction func taxBox(_ sender: UISlider) {
        s2 = Double(sender.value)
        taxLabel.text = "\(s2)"
        calculateTotal()
    }
    
    //take in the tip; call a function to produce the total
    @IBAction func tipBox(_ sender: UISlider) {
        s3 = Double(sender.value)
        tipLabel.text = "\(s3)"
        calculateTotal()
    }
    
    //produce the total
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
    
    //add a done button
    func exitKeyboard() {
        //add a done button with flexible space to the toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit() //Fit inside the toolbar
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil) //set flexibleSpace for done button
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.doneClicked)) //add done button
        
        //add flexibleSpace and doneButton to toolbar
        toolbar.setItems([flexibleSpace,doneButton], animated: false)
        
        //add toolbar to numberpad
        input1.inputAccessoryView = toolbar
        
        //add decimal point to numberpad
        input1.keyboardType = UIKeyboardType.decimalPad
    }
    
    //have toolbar close after clicking done button
    func doneClicked() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        exitKeyboard() //exit out of keyboard when done is pressed
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
