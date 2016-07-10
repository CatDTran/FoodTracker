//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by Sriracha Sauce on 6/19/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import XCTest
@testable import FoodTracker

class FoodTrackerTests: XCTestCase {
    //MARK: FoodTracker Tests
    func testMealInitialization(){
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)//sucess test case
        XCTAssertNotNil(potentialItem)//test for not nil
        let noName = Meal(name: "", photo: nil, rating: 0)//failure case with no name
        XCTAssertNil(noName, "Empty name is invalid")//test for nil
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)//failure case with negative rating
        XCTAssertNil(badRating, "Negative rating sucks, be positive")//test for not nil
    }
    
}
