//
//  Meal.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 7/10/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
class Meal{
    //MARK: Properties
    var name : String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        if name.isEmpty || rating < 0{//initilazation will return nil if no name is enter or rating is negative
            return nil
        }
        
    }
    
}
