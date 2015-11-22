//
//  MealCatalog.swift
//  Manja
//
//  Created by Faustino da Silva on 17/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import Foundation

class MealCatalog {
    static private var mealCategories: [Category] = [Category]()
    
    static func loadData() {
        if let savedMealCategories = loadFromDisk() {
            mealCategories = savedMealCategories
        } else {
            loadSampleData()
        }
    }
    
    static func categories() -> [Category] {
        return mealCategories
    }
    
    static func categoryAt(index: Int) -> Category? {
        if index > -1 && index < mealCategories.count {
            return mealCategories[index]
        }
        return nil
    }
    
    static func categoryIndex(categoryName: String) -> Int {
        for i in 0..<mealCategories.count {
            if mealCategories[i].name == categoryName {
                return i
            }
        }
        return -1
    }
    
    static func categoryCount() -> Int {
        return mealCategories.count
    }
    
    static func addCategory(category: Category) {
        mealCategories.append(category)
    }
    
    static func removeCategory(atIndex: Int) -> Category {
        return mealCategories.removeAtIndex(atIndex)
    }
    
    static func insertCategory(category: Category, atCategoryIndex: Int) {
        mealCategories.insert(category, atIndex: atCategoryIndex)
    }
    
    static func moveCategory(fromIndex: Int, toIndex: Int) {
        let category = mealCategories.removeAtIndex(fromIndex)
        mealCategories.insert(category, atIndex: toIndex)
    }
    
    static func addMeal(meal: Meal, atCategoryIndex: Int) {
        mealCategories[atCategoryIndex].meals.append(meal)
    }
    
    static func insertMeal(meal: Meal, atIndexPath: NSIndexPath) {
        mealCategories[atIndexPath.section].meals.insert(meal, atIndex: atIndexPath.row)
    }
    
    static func removeMeal(atIndexPath: NSIndexPath) -> Meal {
        return mealCategories[atIndexPath.section].meals.removeAtIndex(atIndexPath.row)
    }
    
    static func swapMeal(meal: Meal, atIndexPath: NSIndexPath) {
        mealCategories[atIndexPath.section].meals[atIndexPath.row] = meal
    }
    
    static func categoryName(atIndex: Int) -> String {
        return mealCategories[atIndex].name
    }
    
    static func meal(atCategoryIndex: Int, atIndex: Int) -> Meal {
        return mealCategories[atCategoryIndex].meals[atIndex]
    }
    
    static func meal(atIndexPath: NSIndexPath) -> Meal {
        return mealCategories[atIndexPath.section].meals[atIndexPath.row]
    }
    
    static private func loadSampleData() {
        mealCategories.append(Category(name: "Bebidas", meals: [
            Meal(name: "Garrafa de Água", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 750)!,
            Meal(name: "Copo de Água", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 1)], referenceServing: 1, serving: 175)!,
            Meal(name: "Café", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 60), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 40)], referenceServing: 1, serving: 1)!,
            Meal(name: "Descafeinado", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryWater", value: 40)], referenceServing: 1, serving: 1)!,
            Meal(name: "Sumo de Laranja LIDL", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 81), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 18.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 17.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 1.4)], referenceServing: 200, serving: 200)!,
            Meal(name: "Vigor Magro", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300)], referenceServing: 250, serving: 100)!,
            Meal(name: "Vigor Magro e Descafeinado", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 87), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!,
            Meal(name: "Vigor Meio Gordo e Descafeinado", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 121), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 13), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 8.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryVitaminB12", value: 0.93), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCalcium", value: 300), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCaffeine", value: 3.33334)], referenceServing: 250, serving: 375)!,
            Meal(name: "Pepsi", category: "Bebidas", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 141), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 35.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 35.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 20)], referenceServing: 330, serving: 330)!]))
        
        mealCategories.append(Category(name: "Pequeno-Almoço & Lanche", meals: [
            Meal(name: "Tortitas de Milho Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 376), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 83.9), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 3.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 700)], referenceServing: 100, serving: 7.1)!,
            Meal(name: "Flocos de Aveia Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 370), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 1.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 56), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 11), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 12), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryThiamin", value: 0.76), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryIron", value: 3.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryPhosphorus", value: 370), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryZinc", value: 2.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryMagnesium", value: 106)], referenceServing: 100, serving: 30)!,
            Meal(name: "Crackers Integrais Pingo Doce", category: "Pequeno-Almoço & Lanche", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 428), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 12.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 5.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 2.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 100, serving: 35.7)!,
            Meal(name: "Salatini Pavesi", category: "Pequeno-Almoço & Lanche", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 441), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 14), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 2.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 65.6), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 6.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 10), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1725)], referenceServing: 100, serving: 31.5)!,
            Meal(name: "Oreo", category: "Pequeno-Almoço & Lanche", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 480), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 20), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 9.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 69), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 38), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 2.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 900)], referenceServing: 100, serving: 44)!]))
        
        mealCategories.append(Category(name: "h3", meals: [
            Meal(name: "Hambúguer (Médio)", category: "h3", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 354), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 22.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 13.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 34.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Hambúguer (Bem Passado)", category: "h3", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 304), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 17.9), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 10.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.2), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 1.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 31.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1300)], referenceServing: 1, serving: 1)!,
            Meal(name: "Cheese", category: "h3", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 160), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 11.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 4.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 3.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 0.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 3.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1100)], referenceServing: 1, serving: 1)!,
            Meal(name: "Arroz", category: "h3", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 390), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 8.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 3.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 70), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFiber", value: 4.8), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 6.4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 1200)], referenceServing: 1, serving: 1)!]))
        
        mealCategories.append(Category(name: "Cerveja", meals: [
            Meal(name: "Sagres", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 40), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.6), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 250)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Preta", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 39), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 4), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.6), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 130)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Bohemia", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 55), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatTotal", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryFatSaturated", value: 0.01), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 3.6), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 0.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.5), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 130)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Limão", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 40), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 6.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 5.7), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Lima-Gengibre", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 38), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 6.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 5.3), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!,
            Meal(name: "Sagres Radler Lima-Maçã Verde", category: "Cerveja", facts: [NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryEnergyConsumed", value: 36), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryCarbohydrates", value: 5.9), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySugar", value: 4.9), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietaryProtein", value: 0.1), NutritionFact(typeIdentifier: "HKQuantityTypeIdentifierDietarySodium", value: 100)], referenceServing: 100, serving: 330)!]))
    }
    
    // MARK: NSCoding
    static func saveData() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(mealCategories, toFile: Category.ArchiveURL.path!)
        /*do {
            try NSFileManager.defaultManager().removeItemAtPath(NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!.URLByAppendingPathComponent("meals").path!)
            print("OK!")
        } catch {
            print("Ooops")
        }*/
        if !isSuccessfulSave {
            /*let ac = UIAlertController(title: "NImpl", message: "Editing on long press not yet implemented", preferredStyle: .Alert)
            ac.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(ac, animated: true, completion: nil)*/
        }
    }
    
    static private func loadFromDisk() -> [Category]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Category.ArchiveURL.path!) as? [Category]
    }
}