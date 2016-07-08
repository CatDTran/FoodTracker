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
    var rating = 0
    var ratingButtons = [UIButton]()//and array of buttons
    let spacing = 5
    let starCount = 5

    //MARK: Initilization
    required init?(coder aDecoder: NSCoder) {//implementation of initializer is required by UIView superclass
        super.init(coder : aDecoder)
        for _ in 0..<starCount
        {
            let button = UIButton()
            button.backgroundColor = UIColor.redColor()
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
    }
    override func intrinsicContentSize() -> CGSize {
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        return CGSize(width: width, height: buttonSize)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed ")
    }
}
