//
//  ImageViewController.swift
//  Le App
//
//  Created by Jacob Aronoff on 4/7/16.
//  Copyright © 2016 Jacob Aronoff. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class ImageViewController: UIViewController{
    
    
    @IBOutlet var pokemon_image: UIImageView!
    var image_to_get: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()//Constructor for view controller, call the super constructor
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()//memory management, dont need to touch this.
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print(image_to_get)
        let URL = NSURL(string: image_to_get)!
        pokemon_image.af_setImageWithURL(URL)
    }
}