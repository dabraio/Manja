//
//  MealListTableViewController.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class MealListTableViewController: UITableViewController {
    struct Category {
        var name: String
        var meals: [Meal]
    }
    
    // MARK: Properties
    var meals: [Category] = [Category]()
    
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
        meals.append(Category(name: "Beverages", meals: [Meal(name: "Garrafa de Água", facts: ["HKQuantityTypeIdentifierDietaryWater": 1], referenceServing: 1, serving: 750)!,
            Meal(name: "Copo de Água", facts: ["HKQuantityTypeIdentifierDietaryWater": 1], referenceServing: 1, serving: 175)!,
            Meal(name: "Café", facts: ["HKQuantityTypeIdentifierDietaryCaffeine": 60], referenceServing: 1, serving: 1)!,
            Meal(name: "Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryCaffeine": 5], referenceServing: 1, serving: 1)!,
            Meal(name: "Sumo de Laranja LIDL", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 81, "HKQuantityTypeIdentifierDietaryCarbohydrates": 18.8, "HKQuantityTypeIdentifierDietarySugar": 17.2, "HKQuantityTypeIdentifierDietaryFiber": 0.2, "HKQuantityTypeIdentifierDietaryProtein": 1.4], referenceServing: 200, serving: 200)!,
            Meal(name: "Vigor Magro", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 87, "HKQuantityTypeIdentifierDietaryFatTotal": 0.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 1, "HKQuantityTypeIdentifierDietaryCalcium": 300], referenceServing: 250, serving: 100)!,
            Meal(name: "Vigor Magro e Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 87, "HKQuantityTypeIdentifierDietaryFatTotal": 0.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 1, "HKQuantityTypeIdentifierDietaryCalcium": 300, "HKQuantityTypeIdentifierDietaryCaffeine": 3.33334], referenceServing: 250, serving: 375)!,
            Meal(name: "Vigor Meio Gordo e Descafeinado", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 121, "HKQuantityTypeIdentifierDietaryFatTotal": 4, "HKQuantityTypeIdentifierDietaryFatSaturated": 2.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 13, "HKQuantityTypeIdentifierDietarySugar": 13, "HKQuantityTypeIdentifierDietaryProtein": 8.5, "HKQuantityTypeIdentifierDietarySodium": 250, "HKQuantityTypeIdentifierDietaryVitaminB12": 0.93, "HKQuantityTypeIdentifierDietaryCalcium": 300, "HKQuantityTypeIdentifierDietaryCaffeine": 3.33334], referenceServing: 250, serving: 375)!]))
        
        meals.append(Category(name: "Food", meals: [Meal(name: "Tortitas de Milho Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 376, "HKQuantityTypeIdentifierDietaryFatTotal": 1, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.4, "HKQuantityTypeIdentifierDietaryCarbohydrates": 83.9, "HKQuantityTypeIdentifierDietarySugar": 0.5, "HKQuantityTypeIdentifierDietaryFiber": 3.2, "HKQuantityTypeIdentifierDietaryProtein": 6.2, "HKQuantityTypeIdentifierDietarySodium": 700], referenceServing: 100, serving: 7.1)!,
            Meal(name: "Flocos de Aveia Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 370, "HKQuantityTypeIdentifierDietaryFatTotal": 8.4, "HKQuantityTypeIdentifierDietaryFatSaturated": 1.3, "HKQuantityTypeIdentifierDietaryCarbohydrates": 56, "HKQuantityTypeIdentifierDietarySugar": 1, "HKQuantityTypeIdentifierDietaryFiber": 11, "HKQuantityTypeIdentifierDietaryProtein": 12, "HKQuantityTypeIdentifierDietarySodium": 100, "HKQuantityTypeIdentifierDietaryThiamin": 0.76, "HKQuantityTypeIdentifierDietaryIron": 3.8, "HKQuantityTypeIdentifierDietaryPhosphorus": 370, "HKQuantityTypeIdentifierDietaryZinc": 2.2, "HKQuantityTypeIdentifierDietaryMagnesium": 106], referenceServing: 100, serving: 30)!,
            Meal(name: "Crackers Integrais Pingo Doce", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 428, "HKQuantityTypeIdentifierDietaryFatTotal": 12.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 5.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 65.5, "HKQuantityTypeIdentifierDietarySugar": 2.2, "HKQuantityTypeIdentifierDietaryFiber": 6.1, "HKQuantityTypeIdentifierDietaryProtein": 10.8, "HKQuantityTypeIdentifierDietarySodium": 1300], referenceServing: 100, serving: 35.7)!,
            Meal(name: "Salatini Pavesi", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 441, "HKQuantityTypeIdentifierDietaryFatTotal": 14, "HKQuantityTypeIdentifierDietaryFatSaturated": 2.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 65.6, "HKQuantityTypeIdentifierDietarySugar": 3, "HKQuantityTypeIdentifierDietaryFiber": 6.1, "HKQuantityTypeIdentifierDietaryProtein": 10, "HKQuantityTypeIdentifierDietarySodium": 1725], referenceServing: 100, serving: 31.5)!,
            Meal(name: "Oreo", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 480, "HKQuantityTypeIdentifierDietaryFatTotal": 20, "HKQuantityTypeIdentifierDietaryFatSaturated": 9.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 69, "HKQuantityTypeIdentifierDietarySugar": 38, "HKQuantityTypeIdentifierDietaryFiber": 2.5, "HKQuantityTypeIdentifierDietaryProtein": 5, "HKQuantityTypeIdentifierDietarySodium": 900], referenceServing: 100, serving: 44)!]))
        
        meals.append(Category(name: "h3", meals: [Meal(name: "Hambúguer (Médio)", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 354, "HKQuantityTypeIdentifierDietaryFatTotal": 22.1, "HKQuantityTypeIdentifierDietaryFatSaturated": 13.2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 4.5, "HKQuantityTypeIdentifierDietarySugar": 0.8, "HKQuantityTypeIdentifierDietaryFiber": 1.5, "HKQuantityTypeIdentifierDietaryProtein": 34.8, "HKQuantityTypeIdentifierDietarySodium": 1300], referenceServing: 1, serving: 1)!,
            Meal(name: "Hambúguer (Bem Passado)", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 304, "HKQuantityTypeIdentifierDietaryFatTotal": 17.9, "HKQuantityTypeIdentifierDietaryFatSaturated": 10.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 4.2, "HKQuantityTypeIdentifierDietarySugar": 0.7, "HKQuantityTypeIdentifierDietaryFiber": 1.4, "HKQuantityTypeIdentifierDietaryProtein": 31.1, "HKQuantityTypeIdentifierDietarySodium": 1300], referenceServing: 1, serving: 1)!,
            Meal(name: "Cheese", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 160, "HKQuantityTypeIdentifierDietaryFatTotal": 11.7, "HKQuantityTypeIdentifierDietaryFatSaturated": 4.7, "HKQuantityTypeIdentifierDietaryCarbohydrates": 4.5, "HKQuantityTypeIdentifierDietarySugar": 3.7, "HKQuantityTypeIdentifierDietaryFiber": 0.4, "HKQuantityTypeIdentifierDietaryProtein": 3.3, "HKQuantityTypeIdentifierDietarySodium": 1100], referenceServing: 1, serving: 1)!,
            Meal(name: "Arroz", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 390, "HKQuantityTypeIdentifierDietaryFatTotal": 8.4, "HKQuantityTypeIdentifierDietaryFatSaturated": 3.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 70, "HKQuantityTypeIdentifierDietarySugar": 1, "HKQuantityTypeIdentifierDietaryFiber": 4.8, "HKQuantityTypeIdentifierDietaryProtein": 6.4, "HKQuantityTypeIdentifierDietarySodium": 1200], referenceServing: 1, serving: 1)!]))
        
        meals.append(Category(name: "h3 (Other)", meals: [Meal(name: "Molho", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 114, "HKQuantityTypeIdentifierDietaryFatTotal": 4.9, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.9, "HKQuantityTypeIdentifierDietaryCarbohydrates": 4.3, "HKQuantityTypeIdentifierDietarySugar": 2.4, "HKQuantityTypeIdentifierDietaryProtein": 2.2, "HKQuantityTypeIdentifierDietarySodium": 700], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Molho Tuga", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 26, "HKQuantityTypeIdentifierDietaryFatTotal": 0.8, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.1, "HKQuantityTypeIdentifierDietaryCarbohydrates": 3.9, "HKQuantityTypeIdentifierDietarySugar": 3.5, "HKQuantityTypeIdentifierDietaryProtein": 0.3, "HKQuantityTypeIdentifierDietarySodium": 1300], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Ovo Estrelado", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 88, "HKQuantityTypeIdentifierDietaryFatTotal": 6.9, "HKQuantityTypeIdentifierDietaryFatSaturated": 1.6, "HKQuantityTypeIdentifierDietaryProtein": 6.2, "HKQuantityTypeIdentifierDietarySodium": 300], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Alho", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 6, "HKQuantityTypeIdentifierDietaryFatTotal": 2, "HKQuantityTypeIdentifierDietaryCarbohydrates": 1.3, "HKQuantityTypeIdentifierDietaryFiber": 0.1, "HKQuantityTypeIdentifierDietaryProtein": 0.3], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Rúcula", facts: ["HKQuantityTypeIdentifierDietaryFiber": 0.1, "HKQuantityTypeIdentifierDietaryProtein": 0.6], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Parmigiano", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 49, "HKQuantityTypeIdentifierDietaryFatTotal": 3.3, "HKQuantityTypeIdentifierDietaryFatSaturated": 1.8, "HKQuantityTypeIdentifierDietaryProtein": 4.5, "HKQuantityTypeIdentifierDietarySodium": 200], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Molho de Azeite e Limão", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 88, "HKQuantityTypeIdentifierDietaryFatTotal": 9.8, "HKQuantityTypeIdentifierDietaryFatSaturated": 1.6], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Legumes Grelhados", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 71, "HKQuantityTypeIdentifierDietaryFatTotal": 3.6, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.8, "HKQuantityTypeIdentifierDietaryCarbohydrates": 7.7, "HKQuantityTypeIdentifierDietarySugar": 6.1, "HKQuantityTypeIdentifierDietaryFiber": 1.7, "HKQuantityTypeIdentifierDietaryProtein": 1.5, "HKQuantityTypeIdentifierDietarySodium": 900], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Requeijão", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 41, "HKQuantityTypeIdentifierDietaryFatTotal": 1.7, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.9, "HKQuantityTypeIdentifierDietaryCarbohydrates": 0.6, "HKQuantityTypeIdentifierDietarySugar": 0.6, "HKQuantityTypeIdentifierDietaryProtein": 1.4, "HKQuantityTypeIdentifierDietarySodium": 100], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Molho de Azeite e Limão", facts: ["HKQuantityTypeIdentifierDietaryEnergyConsumed": 44, "HKQuantityTypeIdentifierDietaryFatTotal": 4.9, "HKQuantityTypeIdentifierDietaryFatSaturated": 0.8, "HKQuantityTypeIdentifierDietarySodium": 100], referenceServing: 1, serving: 1)!]))
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
        return meals[section].meals.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "MealListTableViewCell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        
        // Fetches the appropriate meal for the data source layout.
        let meal = meals[indexPath.section].meals[indexPath.row]
        
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
            meals[indexPath.section].meals.removeAtIndex(indexPath.row)
            // Save the meals.
            saveMeals()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }/* else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }*/
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name
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
                let selectedMeal = meals[indexPath.section].meals[indexPath.row]
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
