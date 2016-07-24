//
//  MealTableViewController.swift
//  FoodTracker
//
//  Created by Sriracha Sauce on 7/11/16.
//  Copyright © 2016 Sriracha Sauce. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    //MARK: Properties
    var meals = [Meal]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem() //adding Edit button to the left of navigation bar

        loadSampleMeals()//called to load sample meals data
    }
    
    //Helper method to load sample meals data
    func loadSampleMeals(){
        let photo1 = UIImage(named: "meal1")!
        let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4)!
        
        let photo2 = UIImage(named: "meal2")!
        let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5)!
        
        let photo3 = UIImage(named: "meal3")!
        let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3)!
        meals += [meal1, meal2, meal3]//add initialized Meal objects to the array
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! MealTableViewCell
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        return cell
    }
    
    @IBAction func unwindToMealList(sender: UIStoryboardSegue){
        //this is 2 checks in when if condition: segue's sourceViewController must be MealViewController AND MealViewController's meal must not be nil for this condition to pass
        if let sourceViewController = sender.sourceViewController as? MealViewController, meal = sourceViewController.meal{
            if let selectedIndexPath = tableView.indexPathForSelectedRow//if this condition pass, it means user clicked on an existing row for editing
            {
                meals[selectedIndexPath.row] = meal//replace the existing meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)//reload view
            }
            else//add new meal to list if condition is false
            {
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)//append meal to meals list
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)//add a row for meal to tableView ("tableView: UITableView!" is declared property in UITableViewController)
            }
        }
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            meals.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail"{ //if the segue's identifier is "ShowDetail"
            let mealDetailViewController = segue.destinationViewController as! MealViewController
            if let selectedMealCell = sender as? MealTableViewCell{
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = meals[indexPath.row]
                mealDetailViewController.meal = selectedMeal
            }
        }
        else if segue.identifier == "AddItem"{
            print("Adding new meal")
        }
        
    }
    

}
