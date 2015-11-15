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
        if let _ = loadMeals() {
            // meals += savedMeals
        } else {
            // Load the sample data.
            loadSampleMeals()
        }
    }
    
    func loadSampleMeals() {
        meals.append(Category(name: "Bebidas", meals: [
            Meal(name: "Garrafa de Água", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 750)!,
            Meal(name: "Copo de Água", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 175)!,
            Meal(name: "Café", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 60), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 40)], referenceServing: 1, serving: 1)!,
            Meal(name: "Descafeinado", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 40)], referenceServing: 1, serving: 1)!,
            Meal(name: "Sumo de Laranja LIDL", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 81), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 18.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 17.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 1.4)], referenceServing: 200, serving: 200)!,
            Meal(name: "Vigor Magro", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300)], referenceServing: 250, serving: 100)!,
            Meal(name: "Vigor Magro e Descafeinado", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!,
            Meal(name: "Vigor Meio Gordo e Descafeinado", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 121), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 0.93), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!,
            Meal(name: "Pepsi", category: "Bebidas", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 141), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 35.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 35.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 20)], referenceServing: 330, serving: 330)!]))
        
        meals.append(Category(name: "Pequeno-Almoço & Lanche", meals: [
            Meal(name: "Tortitas de Milho Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 376), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 83.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 3.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 700)], referenceServing: 100, serving: 7.1)!,
            Meal(name: "Flocos de Aveia Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 370), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 56), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 11), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 12), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryThiamin", value: 0.76), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryIron", value: 3.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryPhosphorus", value: 370), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryZinc", value: 2.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryMagnesium", value: 106)], referenceServing: 100, serving: 30)!,
            Meal(name: "Crackers Integrais Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 428), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 12.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 5.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 2.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 100, serving: 35.7)!,
            Meal(name: "Salatini Pavesi", category: "Pequeno-Almoço & Lanche", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 441), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 14), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1725)], referenceServing: 100, serving: 31.5)!,
            Meal(name: "Oreo", category: "Pequeno-Almoço & Lanche", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 480), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 20), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 9.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 69), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 38), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 2.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 900)], referenceServing: 100, serving: 44)!]))
        
        meals.append(Category(name: "h3", meals: [
            Meal(name: "Hambúguer (Médio)", category: "h3", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 354), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 22.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 13.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 34.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Hambúguer (Bem Passado)", category: "h3", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 304), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 17.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 10.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.2), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 31.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Cheese", category: "h3", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 160), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 11.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 4.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 3.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1100)], referenceServing: 1, serving: 1)!,
            Meal(name: "Arroz", category: "h3", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 390), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 3.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 70), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 4.8), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1200)], referenceServing: 1, serving: 1)!]))
        
        meals.append(Category(name: "Cerveja", meals: [
            Meal(name: "Sagres", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 40), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Preta", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 39), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 130)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Bohemia", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 55), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 3.6), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.5), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 130)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Limão", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 40), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 6.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 5.7), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Lima-Gengibre", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 38), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 6.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 5.3), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Lima-Maçã Verde", category: "Cerveja", facts: [Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 36), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 5.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 4.9), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), Meal.Fact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!]))
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
            tableView.reloadSections(NSIndexSet(index: indexPath.section), withRowAnimation: .None)
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
        // Get the cell that generated this segue.
        let mealViewController = (segue.destinationViewController as! UINavigationController).viewControllers[0] as! MealTableViewController
        if segue.identifier == "AddOrEditMeal" {
            mealViewController.editMode = tableView.editing ? .Edit : .Add
            
            if let selectedMealCell = sender as? UITableViewCell {
                let indexPath = tableView.indexPathForCell(selectedMealCell)!
                let selectedMeal = meals[indexPath.section].meals[indexPath.row]
                
                mealViewController.meal = selectedMeal.copy() as? Meal
            }
        } else if segue.identifier == "NewMeal" {
            mealViewController.editMode = .New
            mealViewController.meal = Meal()
        }
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.sourceViewController as? MealTableViewController, meal = sourceViewController.meal {
            switch sourceViewController.editMode {
            case .Add:
                meal.sendToHealth()
            case .Edit:
                if let selectedIndexPath = tableView.indexPathForSelectedRow {
                    var cleanedFacts: [Meal.Fact] = []
                    for fact in meal.facts {
                        if fact.value != 0 {
                            cleanedFacts.append(fact)
                        }
                    }
                    meal.facts = cleanedFacts
                
                    let oldMeal = meals[selectedIndexPath.section].meals[selectedIndexPath.row]
                    
                    if meal.category == oldMeal.category {
                        meals[selectedIndexPath.section].meals[selectedIndexPath.row] = meal
                        tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .Fade)
                    } else {
                        meals[selectedIndexPath.section].meals.removeAtIndex(selectedIndexPath.row)
                        
                        if meals[selectedIndexPath.section].meals.isEmpty {
                            meals.removeAtIndex(selectedIndexPath.section)
                        }
                        
                        var mealCategoryIndex: Int = -1
                        for x in 0 ..< meals.count {
                            if meals[x].name == meal.category {
                                mealCategoryIndex = x
                                break
                            }
                        }
                        if mealCategoryIndex > -1 {
                            meals[mealCategoryIndex].meals.append(meal)
                        } else {
                            meals.append(Category(name: meal.category, meals: [meal]))
                        }
                        
                        tableView.reloadData()
                    }
                }
            case .New:
                var cleanedFacts: [Meal.Fact] = []
                for fact in meal.facts {
                    if fact.value != 0 {
                        cleanedFacts.append(fact)
                    }
                }
                meal.facts = cleanedFacts
                
                var mealCategoryIndex: Int = -1
                for x in 0 ..< meals.count {
                    if meals[x].name == meal.category {
                        mealCategoryIndex = x
                        break
                    }
                }
                if mealCategoryIndex > -1 {
                    meals[mealCategoryIndex].meals.append(meal)
                } else {
                    meals.append(Category(name: meal.category, meals: [meal]))
                }
                tableView.reloadData()
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
