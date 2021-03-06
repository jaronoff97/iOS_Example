//
//  TableViewController.swift
//  Le App
//
//  Created by Jacob Aronoff on 3/29/16.
//  Copyright © 2016 Jacob Aronoff. All rights reserved.
//

import UIKit
import Alamofire//package to get data


struct ImageObject {
    var image_name: String
    var image_url: String
}

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    @IBOutlet var tableView: UITableView!//Set up tableview which is an object in our storyboard
    @IBOutlet var searchField: UITextField!             //create a textfile variable
    
    var image_last_clicked=""
    
    let textCellIdentifier = "TextCell"//Set up the cell identifier to know which cell in our table we want
    
    var url_data = ["Ray Wenderlich", "NSHipster", "iOS Developer Tips", "Jameson Quave", "Natasha The Robot", "Coding Explorer", "That Thing In Swift", "Andrew Bancroft", "iAchieved.it", "Airspeed Velocity"]//sample data
    var pic_data = [ImageObject]()
    
    
    func getData(url: String, params: [String: String]){
        
        Alamofire.request(.GET, url, parameters: params)
            .responseJSON { response in
                var toReturn = [String]()
                /*print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                */
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(response.data! , options: .AllowFragments)
                    //print(json)
                    if let sprites = json["sprites"] as? [String: AnyObject]{
                        sprites.forEach({ (key, value) in
                            print("[\(key) : \(value)]")
                            if let casted: String = value as? String{
                                self.pic_data.append(ImageObject(image_name: key, image_url: casted ))
                            }
                            else {
                            }
                            
                           
                        })
                    }
                    if let moves = json["moves"] as? [[String: AnyObject]] {
                        for move in moves {
                            move.forEach({ (key, value) in
                                if let name = value["name"] as? String{
                                    toReturn.append(name)
                                }
                            })
                        }
                    }
                    print("FINISHED")
                    self.url_data=toReturn
                    self.tableView.reloadData()
                } catch {
                    print("error serializing JSON: \(error)")
                }
        }    }
    
    override func viewDidLoad() {
        super.viewDidLoad()//super constructor
        getData("http://pokeapi.co/api/v2/pokemon/100/", params: [:])
        tableView.delegate = self//tell the table where it'll find its methods
        searchField.delegate = self
        searchField.addTarget(self, action: #selector(TableViewController.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
        searchField.addTarget(self, action: #selector(TableViewController.textFieldDidEndEditing(_:)), forControlEvents: UIControlEvents.EditingDidEnd)
        tableView.dataSource = self//tell the table wherwe it'll find its data
    }
    
    // MARK:  UITextFieldDelegate Methods
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {//Method that takes a tableview as a param, -> Int means it will return an integer
        return 1//lol just return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {// take in two params and return an integer to describe the amount of data
        return pic_data.count// return the count of data
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {//This method will reutnr a cell for a given row
        let cell = tableView.dequeueReusableCellWithIdentifier(textCellIdentifier, forIndexPath: indexPath)//Get a cell from the table view which is identied as a "TextCell" at the given indexpath
        
        let row = indexPath.row//Make temp constant to describe the row the method wants
        cell.textLabel?.text = pic_data[row].image_name//set the cell's text equal to the data at the row
        
        return cell//return the cell
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ImageSegue" {
            if let destinationVC = segue.destinationViewController as? ImageViewController{
                destinationVC.image_to_get = image_last_clicked
                print("SET VALUE")
            }
        }
        
    }
    // MARK:  UITableViewDelegate Methods
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {//The cell was selected at a row
        tableView.deselectRowAtIndexPath(indexPath, animated: true)//Tell the UI to visually deselct it
        
        let row = indexPath.row//get the row
        print(pic_data[row])//print the row
        image_last_clicked = pic_data[row].image_url
    }
        func textFieldDidEndEditing(textField: UITextField) {
        print(textField.text)
    }
    func textFieldDidChange(textField: UITextField) {
        print(textField.text)
        let pokemon = textField.text!
        getData("http://pokeapi.co/api/v2/pokemon/\(pokemon)/", params: [:])
        //your code
    }
    
}