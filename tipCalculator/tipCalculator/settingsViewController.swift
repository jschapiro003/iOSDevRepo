//
//  settingsViewController.swift
//  tipCalculator
//
//  Created by Jonathan Schapiro on 9/17/14.
//  Copyright (c) 2014 Jonathan Schapiro. All rights reserved.
//

import UIKit

class settingsViewController: UIViewController {

    
    @IBOutlet weak var cheapTipSwitch: UISwitch!
    
    @IBOutlet weak var averageTipSwitch: UISwitch!
    
    @IBOutlet weak var greatTipSwitch: UISwitch!
    
    var tipIndex = -1
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cheapTipSwitchPressed(sender: AnyObject) {
        if cheapTipSwitch.on{
            averageTipSwitch.on=false
            greatTipSwitch.on=false
            tipIndex = 0
        }
    }
    
    @IBAction func averageTipSwitchPressed(sender: AnyObject) {
        if averageTipSwitch.on{
            cheapTipSwitch.on=false;
            greatTipSwitch.on=false;
            tipIndex = 1
        }
    }
    
    
    @IBAction func greatTipSwitchPressed(sender: AnyObject) {
        if greatTipSwitch.on{
            cheapTipSwitch.on=false
            averageTipSwitch.on=false
            tipIndex = 2
        }
    }
   
    @IBAction func saveTipSettings(sender: AnyObject) {
        
        var defaults = NSUserDefaults.standardUserDefaults()
       
        defaults.setInteger(tipIndex, forKey: "defaultTipPercentage");
        
        println(tipIndex)
        
        
        defaults.synchronize()
        

    }

    @IBAction func returnHome(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
