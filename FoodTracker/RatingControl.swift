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

    //MARK: Initilization
    required init?(coder aDecoder: NSCoder) {//implementation of initializer is required by UIView superclass
        super.init(coder : aDecoder)
        for _ in 0..<5
        {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
            button.backgroundColor = UIColor.redColor()
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: UIControlEvents.TouchDown)
            ratingButtons += [button]//add button to the array
            addSubview(button)
        }
    }
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        print("Button pressed ")
    }
}
