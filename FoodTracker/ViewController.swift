//
//  ViewController.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 6/19/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
//UI***Delegate are protocols
class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self// decleare this class as delegate for TextField; "self" refer to this ViewController class
    }
    
    // MARK:*******UITextFieldDelegate*******
    //Get called when user press Return key on keyboard
    func textFieldShouldReturn(textField : UITextField) -> Bool{
        textField.resignFirstResponder()//Resign from first responder status; hide keyboard
        return true
    }
    //This method is called after textFieldShouldReturn() method
    func textFieldDidEndEditing(textField: UITextField) {
        mealNameLabel.text = textField.text
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

