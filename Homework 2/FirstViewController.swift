//
//  FirstViewController.swift
//  Homework 2
//
//  Created by Aaron Sargento on 1/23/17.
//  Copyright © 2017 Aaron Sargento. All rights reserved.
//

// Input: No input.
// Output: No output. First view controller is the Home tab

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var AppTitle: UILabel!
    
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
        
        //round the edges of the title
        roundLabels(label: AppTitle)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

