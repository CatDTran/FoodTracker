//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 7/7/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    //MARK: Properties
    var rating = 0{
        didSet{//this is a properties obesever; it's called immediately after a property's value is changed
            //setNeedsLayout()//this callback triggers a layout update
        }
    }
    var ratingButtons = [UIButton]()//and array of buttons
    let spacing = 5
    let starCount = 5

    //MARK: Initilization
    required init?(coder aDecoder: NSCoder) {//implementation of initializer is required by UIView superclass
        super.init(coder : aDecoder)
        let emptyStarImage = UIImage(named: "emptyStar")//the name string is used to reference image in Assets.xcassets folder
        let filledStarImage = UIImage(named: "filledStar")
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.setImage(emptyStarImage, forState: UIControlState.Normal)//set emptyStarImage when button is not pressed
            button.setImage(filledStarImage, forState: UIControlState.Selected)//set filledStarImage when button is selected
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])//set filledStarImage when button is being pressed
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: UIControlEvents.TouchDown)
            ratingButtons += [button]//add button to the array
            addSubview(button)
        }
    }
    override func layoutSubviews(){
        let buttonSize = Int(frame.size.height)//set buttonSize as the height of its frame (superview)
        var buttonFrame = CGRect(x: 0,y: 0,width: buttonSize,height: buttonSize)
        for (index, button) in ratingButtons.enumerate()//Offseting buttons to spread them out
        {
            buttonFrame.origin.x = CGFloat( index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        updateButtonSelectionStates()//it's important to update stars' states when the view loads
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()//update stars' states when a star is tapped
    }
    
    func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerate()
        {
            button.selected = index < rating//star should be in selected state (filledStarImage) if the rating is higher than its index
        }
    }
}
