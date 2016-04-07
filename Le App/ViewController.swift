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
        var counter:Int? = Int(counterLabel.text!)//make a temp Int set as the value of the counterlabel
        counter = counter!-1//decrement it
        counterLabel.text=String(counter!)//set the counterLabel's text equal to the counter

    }
    @IBAction func plusButton(sender: UIButton) {//Action listener for plus button
        var counter:Int? = Int(counterLabel.text!)//Set up counter
        counter = counter!+1//Increment counter
        counterLabel.text=String(counter!)//Set counterlabel text
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

