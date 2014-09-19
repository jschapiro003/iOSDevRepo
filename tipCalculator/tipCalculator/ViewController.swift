//
//  ViewController.swift
//  tipCalculator
//
//  Created by Jonathan Schapiro on 9/17/14.
//  Copyright (c) 2014 Jonathan Schapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billForTwo: UILabel!
    @IBOutlet weak var billForFour: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex=defaults.integerForKey("defaultTipPercentage")
        println(tipControl.selectedSegmentIndex)
        
        
        
        tipLabel.text="$0.00"
        totalAmountLabel.text="$0.00"
        billForTwo.text = "$0.00"
        billForFour.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages [tipControl.selectedSegmentIndex]
        
        
        var billAmount = NSString(string: billAmountField.text).doubleValue
        
        var tip=billAmount * tipPercentage
        
        var total=billAmount + tip
        
        var splitByTwo = total / 2
        
        var splitByFour = total / 4
        
     
        
        tipLabel.text = String(format: "$%.2f", tip);
        totalAmountLabel.text = String(format: "$%.2f", total);
        billForTwo.text = String(format: "$%.2f", splitByTwo);
        billForFour.text = String(format: "$%.2f", splitByFour);
        
        UIView.animateWithDuration(1.5, animations: {
            self.totalAmountLabel.alpha = 0
            self.totalAmountLabel.alpha = 1
            self.tipLabel.alpha = 0
            self.tipLabel.alpha = 1 
            self.billForTwo.alpha = 0
            self.billForTwo.alpha = 1
            self.billForFour.alpha = 0
            self.billForFour.alpha = 1
            
            
            
        })
        
        
    }

    @IBAction func onTap(sender: UIGestureRecognizer) {
       
        
        
        view.endEditing(true)
        
    }
    @IBAction func goToSettings(sender: AnyObject) {
        
        performSegueWithIdentifier("goToSettings", sender: self)
    }
}

