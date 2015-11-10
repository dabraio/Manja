//
//  MealListTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    // MARK: Properties
    var meals: [String: [Meal]] = [String: [Meal]]()
    
    private func getCategory(index: Int) -> String {
        return Array(meals.keys)[index]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Use the edit button item provided by the table view controller.
        navigationItem.leftBarButtonItem = editButtonItem()

        // Load any saved meals, otherwise load sample data.
        if let savedMeals = loadMeals() {
            // meals += savedMeals
        } else {
            // Load the sample data.
            loadSampleMeals()
        }
    }
    
    func loadSampleMeals() {
        meals["Beverages"] = [Meal(name: "Garrafa de Água", facts: ["HKQuantityTypeIdentifierDietaryWater": 1], referenceServing: 1, serving: 750)!,
            Meal(name: "Copo de Água", facts: ["HKQuantityTypeIdentifierDietaryWater": 1], referenceServing: 1, serving: 175)!,
            Meal(name: "Café", facts: ["HKQuantityTypeIdentifierDietaryCaffeine": 60], referenceServing: 1, serving: 1)!,
            Meal(name: "Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryCaffeine": 5], referenceServing: 1, serving: 1)!,
            Meal(name: "Sumo de Laranja LIDL", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 81, "HKQuantityTypeIdentifierDietaryCarbohydrates": 18.8, "HKQuantityTypeIdentifierDietarySugar": 17.2, "HKQuantityTypeIdentifierDietaryFiber": 0.2, "HKQuantityTypeIdentifierDietaryProtein": 1.4], referenceServing: 200, serving: 200)!,
            Meal(name: "Vigor Magro", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 87, "HKQuantityTypeIdentifierDietaryFatTotal": 0.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 1, "HKQuantityTypeIdentifierDietaryCalcium": 300], referenceServing: 250, serving: 100)!,
            Meal(name: "Vigor Magro e Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 87, "HKQuantityTypeIdentifierDietaryFatTotal": 0.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 1, "HKQuantityTypeIdentifierDietaryCalcium": 300, "HKQuantityTypeIdentifierDietaryCaffeine": 3.33334], referenceServing: 250, serving: 375)!,
            Meal(name: "Vigor Meio Gordo e Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 121, "HKQuantityTypeIdentifierDietaryFatTotal": 4, "HKQuantityTypeIdentifierDietaryFatSaturated": 2.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 0.93, "HKQuantityTypeIdentifierDietaryCalcium": 300, "HKQuantityTypeIdentifierDietaryCaffeine": 3.33334], referenceServing: 250, serving: 375)!]
        
        meals["Food"] = [Meal(name: "Tortitas de Milho Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 376, "HKQuantityTypeIdentifierDietaryFatTotal": 1, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.4, "HKQuantityTypeIdentifierDietaryCarbohydrates": 83.9, "HKQuantityTypeIdentifierDietarySugar": 0.5, "HKQuantityTypeIdentifierDietaryFiber": 3.2, "HKQuantityTypeIdentifierDietaryProtein": 6.2, "HKQuantityTypeIdentifierDietarySodium": 700], referenceServing: 100, serving: 7.1)!,
            Meal(name: "Flocos de Aveia Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 370, "HKQuantityTypeIdentifierDietaryFatTotal": 8.4, "HKQuantityTypeIdentifierDietaryFatSaturated": 1.3, "HKQuantityTypeIdentifierDietaryCarbohydrates": 56, "HKQuantityTypeIdentifierDietarySugar": 1, "HKQuantityTypeIdentifierDietaryFiber": 11, "HKQuantityTypeIdentifierDietaryProtein": 12, "HKQuantityTypeIdentifierDietarySodium": 100, "HKQuantityTypeIdentifierDietaryThiamin": 0.76, "HKQuantityTypeIdentifierDietaryIron": 3.8, "HKQuantityTypeIdentifierDietaryPhosphorus": 370, "HKQuantityTypeIdentifierDietaryZinc": 2.2, "HKQuantityTypeIdentifierDietaryMagnesium": 106], referenceServing: 100, serving: 30)!,
            Meal(name: "Crackers Integrais Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 428, "HKQuantityTypeIdentifierDietaryFatTotal": 12.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 5.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 65.5, "HKQuantityTypeIdentifierDietarySugar": 2.2, "HKQuantityTypeIdentifierDietaryFiber": 6.1, "HKQuantityTypeIdentifierDietaryProtein": 10.8, "HKQuantityTypeIdentifierDietarySodium": 1300], referenceServing: 100, serving: 35.7)!,
            Meal(name: "Salatini Pavesi", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 441, "HKQuantityTypeIdentifierDietaryFatTotal": 14, "HKQuantityTypeIdentifierDietaryFatSaturated": 2.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 65.6, "HKQuantityTypeIdentifierDietarySugar": 3, "HKQuantityTypeIdentifierDietaryFiber": 6.1, "HKQuantityTypeIdentifierDietaryProtein": 10, "HKQuantityTypeIdentifierDietarySodium": 1725], referenceServing: 100, serving: 31.5)!,
            Meal(name: "Oreo", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 480, "HKQuantityTypeIdentifierDietaryFatTotal": 20, "HKQuantityTypeIdentifierDietaryFatSaturated": 9.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 69, "HKQuantityTypeIdentifierDietarySugar": 38, "HKQuantityTypeIdentifierDietaryFiber": 2.5, "HKQuantityTypeIdentifierDietaryProtein": 5, "HKQuantityTypeIdentifierDietarySodium": 900], referenceServing: 100, serving: 44)!]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return meals.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals[getCategory(section)]!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealListTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[getCategory(indexPath.section)]![indexPath.row]
        
        cell.textLabel!.text = meal.name
        
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
            meals[getCategory(indexPath.section)]!.removeAtIndex(indexPath.row)
            // Save the meals.
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }/* else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getCategory(section)
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
        if segue.identifier == "AddMeal" {
            let addMealViewController = (segue.destinationViewController as! UINavigationController).viewControllers[0] as! AddMealTableViewController
            // Get the cell that generated this segue.
            if let selectedMealCell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = meals[getCategory(indexPath.section)]![indexPath.row]
                addMealViewController.meal = selectedMeal.copy() as? Meal
            }
        } else if segue.identifier == "NewMeal" {
            //print("Adding new meal.")
        }
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        /*if let sourceViewController = sender.sourceViewController as? NewMealViewController, meal = sourceViewController.meal {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing meal.
                meals[selectedIndexPath.row] = meal
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Right)
            } else {
                // Add a new meal.
                let newIndexPath = NSIndexPath(forRow: meals.count, inSection: 0)
                meals.append(meal)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
            // Save the meals.
            saveMeals()
        } else*/ if let sourceViewController = sender.sourceViewController as? AddMealTableViewController, meal = sourceViewController.meal {
            
            for fact in meal.facts {
                HealthKitManager.saveSample(fact.0, date: meal.timestamp!, value: meal.newValueForType(fact.0), unit: HealthKitManager.types[fact.0]!.unit)
            }
        }
    }
    
    // MARK: NSCoding
    func saveMeals() {
        /*let isSuccessfulSave =*/
        
        //NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path!)
        
        /*if !isSuccessfulSave {
            print("Failed to save meals...")
        }*/
    }
    
    func loadMeals() -> [String: Set<Meal>]? {
        //return NSKeyedUnarchiver.unarchiveObjectWithFile(Meal.ArchiveURL.path!) as? [String: Meal]
        return nil
    }
}
