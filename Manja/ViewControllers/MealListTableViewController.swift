//
//  MealListTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController, UISearchResultsUpdating {
    // MARK: Properties
    var filteredMealCategories: [Category] = [Category]()
    var resultSearchController = UISearchController()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()
        navigationItem.leftBarButtonItem!.tintColor = .whiteColor()
        // Load any saved meals, otherwise load sample data.
        MealCatalog.loadData()
        
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.autocapitalizationType = .Sentences
            controller.searchBar.autocorrectionType = .Yes
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: .Top, animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if (self.resultSearchController.active) {
            return filteredMealCategories.count
        } else {
            return MealCatalog.categoryCount()
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (self.resultSearchController.active) {
            return filteredMealCategories[section].meals.count
        } else {
            return MealCatalog.categoryAt(section)!.meals.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealListTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetches the appropriate meal for the data source layout.
        let meal: Meal?
        if (self.resultSearchController.active) {
            meal = filteredMealCategories[indexPath.section].meals[indexPath.row]
        } else {
            meal = MealCatalog.meal(indexPath.section, atIndex: indexPath.row)
        }
        
        cell.textLabel!.text = meal!.name
        
        return cell
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
            MealCatalog.removeMeal(indexPath)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            MealCatalog.saveData()
        }
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (self.resultSearchController.active) {
            return filteredMealCategories[section].name
        } else {
            return MealCatalog.categoryName(section)
        }
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        MealCatalog.insertMeal(MealCatalog.removeMeal(fromIndexPath), atIndexPath: toIndexPath)
        MealCatalog.meal(toIndexPath).category = MealCatalog.categoryName(toIndexPath.section)
        
        MealCatalog.saveData()
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the cell that generated this segue.
        let mealViewController = (segue.destinationViewController as! UINavigationController).viewControllers[0] as! MealTableViewController
        if segue.identifier == "AddOrEditMeal" {
            mealViewController.editMode = tableView.editing ? .Edit : .Add
            
            if let selectedMealCell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                
                var selectedMeal: Meal
                if (self.resultSearchController.active) {
                    selectedMeal = filteredMealCategories[indexPath.section].meals[indexPath.row]
                } else {
                    selectedMeal = MealCatalog.meal(indexPath)
                }
                
                mealViewController.meal = selectedMeal.copy() as? Meal
                if mealViewController.editMode == .Edit {
                    mealViewController.meal!.restoreEmptyFacts()
                }
            }
        } else if segue.identifier == "NewMeal" {
            mealViewController.editMode = .New
            mealViewController.meal = Meal()
            mealViewController.meal?.category = MealCatalog.categoryAt(0)?.name ?? ""
        }
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealTableViewController, meal = sourceViewController.meal {
            switch sourceViewController.editMode {
            case .Add:
                meal.sendToHealth()
            case .Edit:
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    var cleanedFacts: [NutritionFact] = []
                    for fact in meal.facts {
                        if fact.value != 0 {
                            cleanedFacts.append(fact)
                        }
                    }
                    meal.facts = cleanedFacts
                    let oldMeal = MealCatalog.meal(selectedIndexPath)
                    if meal.category == oldMeal.category {
                        MealCatalog.swapMeal(meal, atIndexPath: selectedIndexPath)
                        tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Fade)
                    } else {
                        MealCatalog.removeMeal(selectedIndexPath)
                        MealCatalog.addMeal(meal, atCategoryIndex: MealCatalog.categoryIndex(meal.category))
                        tableView.reloadData()
                    }
                    MealCatalog.saveData()
                }
            case .New:
                meal.category = meal.category.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
                var cleanedFacts: [NutritionFact] = []
                for fact in meal.facts {
                    if fact.value != 0 {
                        cleanedFacts.append(fact)
                    }
                }
                meal.facts = cleanedFacts
                MealCatalog.addMeal(meal, atCategoryIndex: MealCatalog.categoryIndex(meal.category))
                tableView.reloadData()
                MealCatalog.saveData()
            }
        }
    }
    
    // MARK: UISearchResultsUpdating
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        filteredMealCategories.removeAll(keepCapacity: false)
        for category in MealCatalog.categories() {
            let searchTerm = searchController.searchBar.text!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
            let searchPredicate = NSPredicate(format: "name contains[cd] %@ or category contains[cd] %@", searchTerm, searchTerm)
            let resultsArray = (category.meals as NSArray).filteredArrayUsingPredicate(searchPredicate) as! [Meal]
            if !resultsArray.isEmpty {
                filteredMealCategories.append(Category(name: category.name, meals: resultsArray))
            }
        }
        self.tableView.reloadData()
    }
}
