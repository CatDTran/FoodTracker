//
//  MealViewController.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 6/19/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
//UI***Delegate are protocols
class MealViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self// decleare this class as delegate for TextField; "self" refer to this ViewController class
        checkValidMealName()//make sure to disable Save button until user enter a valid text in TextField
    }
    
    // MARK:*******UITextFieldDelegate*******
    //Get called when user press Return key on keyboard
    func textFieldShouldReturn(textField : UITextField) -> Bool{
        textField.resignFirstResponder()//Resign from first responder status; hide keyboard
        return true
    }
    //called when user begin editing TextField
    func textFieldDidBeginEditing(textField: UITextField) {
        saveButton.enabled = false
    }
    func checkValidMealName(){//helper method to check for valid text in text field
        let text = nameTextField.text ?? ""
        saveButton.enabled = !text.isEmpty
    }
    //This method is called after textFieldShouldReturn() method
    func textFieldDidEndEditing(textField: UITextField) {
        checkValidMealName()
        navigationItem.title = textField.text//replace navigation bar's title with the meal's name after user done with editing text field
    }
    
    // MARK:*******UIImagePickerControllerDelegate*******
    //Get called when user hit Cancel image picker's button
    func imagePickerControllerDidCancel(picker : UIImagePickerController){
        dismissViewControllerAnimated(true, completion : nil)
    }
    //called after user picks an image
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage//cast to UIImage
        photoImageView.image = selectedImage
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Navigation
    @IBAction func cancel(sender: UIBarButtonItem) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    //called when user tap Save button
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender === saveButton{
            let name = nameTextField.text ?? "" //return a string value, if nill return the dafault string which is an empty string ""
            let photo = photoImageView.image
            let rating = ratingControl.rating
            meal = Meal(name: name, photo: photo, rating: rating) //set up a meal to be passed to MealTableViewController
        }
    }
    
    // MARK:*******Actions*******
    //Get called when user tap the ImageView
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()//ensure that keyboard from TextField dismiss when ImageView is tapped
        let imagePickerController = UIImagePickerController()//UIImagePickerController is a view controller that lets user pick image from their library
        //The type of "UIImagePickerController.sourceType" is a "UIImagePickerControllerSourceType";
        //.PhotoLibrary shorthanded for "UIImagePickerControllerSourceType.PhotoLibrary"
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        imagePickerController.delegate = self//set this ViewController as delegate
        presentViewController(imagePickerController, animated: true,completion: nil)
    }
}

