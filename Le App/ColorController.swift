//
//  ColorController.swift
//  Le App
//
//  Created by Jacob Aronoff on 9/17/15.
//  Copyright (c) 2015 Jacob Aronoff. All rights reserved.
//

import UIKit

class ColorController: UIViewController {
    var numberToDisplay = 0//Type infered, We could do
    //var numberToDisplay:Int = 0
    
    @IBOutlet var counterLabel: UILabel!//make a label for the counter
    @IBAction func redButton(sender: UIButton) {//red button action listener
        self.view.backgroundColor = UIColor.redColor()//Set the color equal to red. Notice how the red color is a static variable, however thats infered
    }
    @IBAction func blueButton(sender: UIButton) {//blue button action listener
        self.view.backgroundColor = UIColor.blueColor()//Set the color equal to blue. Notice how the red color is a static variable, however thats infered
    }
    override func viewDidLoad() {//Constructor
        super.viewDidLoad()//Super constructor
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(animated: Bool) {//Method called when segue completed
        super.viewWillAppear(animated)//super call
        
        counterLabel.text = "The counter was tapped \(numberToDisplay) times."//set the counterlabel text
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()//memory management
        // Dispose of any resources that can be recreated.
    }
    
    
}

