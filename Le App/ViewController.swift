//
//  ViewController.swift
//  Le App
//
//  Created by Jacob Aronoff on 9/17/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var counterLabel: UILabel!//Make a UI outlet for the label
    @IBAction func downButton( sender: UIButton) {//This is an action listener for the minus button
       
        if var tempCounter: Int = Int(counterLabel.text!){
            tempCounter-=1
             counterLabel.text=String(tempCounter)//set the counterLabel's text equal to the counter
        }
    }
    @IBAction func plusButton(sender: UIButton) {//Action listener for plus button
        if var tempCounter: Int = Int(counterLabel.text!){
            tempCounter+=1
            counterLabel.text=String(tempCounter)//set the counterLabel's text equal to the counter
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()//Constructor for view controller, call the super constructor
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()//memory management, dont need to touch this.
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {//Segue is a transition between view controllers
        if segue.identifier == "ShowOtherSegue" {//If the segue is identified as "ShowOtherSegue"
            if let destinationVC = segue.destinationViewController as? ColorController{// Try and set the destination as a ColorController (a custom VC of ours)
                destinationVC.numberToDisplay = Int(counterLabel.text!)!//Give it the data
            }
        }
    }


}

