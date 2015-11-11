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
        meals.append(Category(name: "Beverages", meals: [Meal(name: "Garrafa de Água", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 750)!,
            Meal(name: "Copo de Água", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 175)!,
            Meal(name: "Café", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 60)], referenceServing: 1, serving: 1)!,
            Meal(name: "Descafeinado", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 5)], referenceServing: 1, serving: 1)!,
            Meal(name: "Sumo de Laranja LIDL", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 81), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 18.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 17.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 1.4)], referenceServing: 200, serving: 200)!,
            Meal(name: "Vigor Magro", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300)], referenceServing: 250, serving: 100)!,
            Meal(name: "Vigor Magro e Descafeinado", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!,
            Meal(name: "Vigor Meio Gordo e Descafeinado", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 121), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 0.93), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!]))
        
        meals.append(Category(name: "Food", meals: [Meal(name: "Tortitas de Milho Pingo Doce", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 376), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 83.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 3.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 700)], referenceServing: 100, serving: 7.1)!,
            Meal(name: "Flocos de Aveia Pingo Doce", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 370), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 56), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 11), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 12), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryThiamin", value: 0.76), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryIron", value: 3.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryPhosphorus", value: 370), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryZinc", value: 2.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryMagnesium", value: 106)], referenceServing: 100, serving: 30)!,
            Meal(name: "Crackers Integrais Pingo Doce", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 428), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 12.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 5.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 2.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 100, serving: 35.7)!,
            Meal(name: "Salatini Pavesi", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 441), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 14), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1725)], referenceServing: 100, serving: 31.5)!,
            Meal(name: "Oreo", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 480), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 20), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 9.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 69), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 38), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 2.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 900)], referenceServing: 100, serving: 44)!]))
        
        meals.append(Category(name: "h3", meals: [Meal(name: "Hambúguer (Médio)", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 354), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 22.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 13.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 34.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Hambúguer (Bem Passado)", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 304), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 17.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 10.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 31.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Cheese", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 160), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 11.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 4.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 3.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1100)], referenceServing: 1, serving: 1)!,
            Meal(name: "Arroz", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 390), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 3.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 70), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 4.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1200)], referenceServing: 1, serving: 1)!]))
        
        meals.append(Category(name: "h3 (Other)", meals: [Meal(name: "Molho", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 114), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 4.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 2.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 2.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 700)], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Molho Tuga", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 26), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 3.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Ovo Estrelado", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 88), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 6.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Tuga - Alho", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 1.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3)], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Rúcula", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.6)], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Parmigiano", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 49), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 3.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 4.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 200)], referenceServing: 1, serving: 1)!,
            Meal(name: "Med - Molho de Azeite e Limão", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 88), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 9.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.6)], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Legumes Grelhados", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 71), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 3.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 7.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 6.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 1.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 900)], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Requeijão", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 41), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 1.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 0.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 1.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 1, serving: 1)!,
            Meal(name: "Legumes - Molho de Azeite e Limão", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 44), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 4.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 1, serving: 1)!]))
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
            meal.sendToHealth()
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
