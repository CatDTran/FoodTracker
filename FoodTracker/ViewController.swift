//
//  ViewController.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 6/19/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // decleare this class as delegate for TextField
        nameTextField.delegate = self//"self" refer to this ViewController class
    }
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(textField : UITextField) -> Bool{
        //Resign from first responder status; hide keyboard
        textField.resignFirstResponder()
        return true
    }
    //This method is called after textFieldShouldReturn() method
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
    }
    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton) {
        mealNameLabel.text = "Default Text"
    }
    
}

