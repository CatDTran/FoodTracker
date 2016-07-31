//
//  Meal.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 7/10/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit
class Meal: NSObject, NSCoding{
    //MARK: Properties
    var name : String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Archiving Paths
    static let DocumentDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentDirectory.URLByAppendingPathComponent("meals")
    
    //MARK: Types
    struct PropertyKey{
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    //MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
        super.init()
        if name.isEmpty || rating < 0{//initilazation will return nil if no name is enter or rating is negative
            return nil
        }
    }
    
    //MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) { //used to save data
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    required convenience init?(coder aDecoder: NSCoder) {   //used to load data
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        self.init(name: name, photo: photo, rating: rating)
    }
    
}
