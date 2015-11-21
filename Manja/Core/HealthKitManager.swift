//
//  HealthKitManager.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import HealthKit

class HealthKitManager {
    static let healthKitStore: HKHealthStore = HKHealthStore()
    
    static let orderedTypes: [String] = [HKQuantityTypeIdentifierDietaryBiotin, HKQuantityTypeIdentifierDietaryCaffeine, HKQuantityTypeIdentifierDietaryCalcium, HKQuantityTypeIdentifierDietaryCarbohydrates, HKQuantityTypeIdentifierDietaryChloride, HKQuantityTypeIdentifierDietaryChromium, HKQuantityTypeIdentifierDietaryCopper, HKQuantityTypeIdentifierDietaryEnergyConsumed, HKQuantityTypeIdentifierDietaryCholesterol, HKQuantityTypeIdentifierDietarySugar, HKQuantityTypeIdentifierDietaryFiber, HKQuantityTypeIdentifierDietaryFolate, HKQuantityTypeIdentifierDietaryIodine, HKQuantityTypeIdentifierDietaryIron, HKQuantityTypeIdentifierDietaryMagnesium, HKQuantityTypeIdentifierDietaryManganese, HKQuantityTypeIdentifierDietaryMolybdenum, HKQuantityTypeIdentifierDietaryFatMonounsaturated, HKQuantityTypeIdentifierDietaryNiacin, HKQuantityTypeIdentifierDietaryPantothenicAcid, HKQuantityTypeIdentifierDietaryPhosphorus, HKQuantityTypeIdentifierDietaryFatPolyunsaturated, HKQuantityTypeIdentifierDietaryPotassium, HKQuantityTypeIdentifierDietaryProtein, HKQuantityTypeIdentifierDietaryRiboflavin, HKQuantityTypeIdentifierDietaryFatSaturated, HKQuantityTypeIdentifierDietarySelenium, HKQuantityTypeIdentifierDietarySodium, HKQuantityTypeIdentifierDietaryThiamin, HKQuantityTypeIdentifierDietaryFatTotal, HKQuantityTypeIdentifierDietaryVitaminA, HKQuantityTypeIdentifierDietaryVitaminB12, HKQuantityTypeIdentifierDietaryVitaminB6, HKQuantityTypeIdentifierDietaryVitaminC, HKQuantityTypeIdentifierDietaryVitaminD, HKQuantityTypeIdentifierDietaryVitaminE, HKQuantityTypeIdentifierDietaryVitaminK, HKQuantityTypeIdentifierDietaryWater, HKQuantityTypeIdentifierDietaryZinc]
    
    static let types: [String: TypeInfo] = [
        HKQuantityTypeIdentifierDietaryBiotin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryBiotin, shortDescription: "Biotin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryCaffeine: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCaffeine, shortDescription: "Caffeine", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryCalcium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCalcium, shortDescription: "Calcium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryCarbohydrates: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCarbohydrates, shortDescription: "Carbohydrates", unit: HKUnit.gramUnit(), imageName: "Carbs"),
        HKQuantityTypeIdentifierDietaryChloride: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryChloride, shortDescription: "Chloride", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryChromium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryChromium, shortDescription: "Chromium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryCopper: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCopper, shortDescription: "Copper", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryEnergyConsumed: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryEnergyConsumed, shortDescription: "Dietary Calories", unit: HKUnit.kilocalorieUnit(), imageName: "Cals"),
        HKQuantityTypeIdentifierDietaryCholesterol: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCholesterol, shortDescription: "Dietary Cholesterol", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietarySugar: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySugar, shortDescription: "Dietary Sugar", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryFiber: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFiber, shortDescription: "Fibre", unit: HKUnit.gramUnit(), imageName: "Fibre"),
        HKQuantityTypeIdentifierDietaryFolate: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFolate, shortDescription: "Folate", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryIodine: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryIodine, shortDescription: "Iodine", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryIron: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryIron, shortDescription: "Iron", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryMagnesium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryMagnesium, shortDescription: "Magnesium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryManganese: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryManganese, shortDescription: "Manganese", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryMolybdenum: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryMolybdenum, shortDescription: "Molybdenum", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryFatMonounsaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatMonounsaturated, shortDescription: "Monounsaturated Fat", unit: HKUnit.gramUnit(), imageName: "Fat"),
        HKQuantityTypeIdentifierDietaryNiacin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryNiacin, shortDescription: "Niacin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryPantothenicAcid: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPantothenicAcid, shortDescription: "Pantothenic Acid", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryPhosphorus: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPhosphorus, shortDescription: "Phosphorus", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatPolyunsaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatPolyunsaturated, shortDescription: "Polyunsaturated Fat", unit: HKUnit.gramUnit(), imageName: "Fat"),
        HKQuantityTypeIdentifierDietaryPotassium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPotassium, shortDescription: "Potassium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryProtein: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryProtein, shortDescription: "Protein", unit: HKUnit.gramUnit(), imageName: "Protein"),
        HKQuantityTypeIdentifierDietaryRiboflavin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryRiboflavin, shortDescription: "Riboflavin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatSaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatSaturated, shortDescription: "Saturated Fat", unit: HKUnit.gramUnit(), imageName: "Fat"),
        HKQuantityTypeIdentifierDietarySelenium: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySelenium, shortDescription: "Selenium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietarySodium: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySodium, shortDescription: "Sodium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli), imageName: "Sodium"),
        HKQuantityTypeIdentifierDietaryThiamin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryThiamin, shortDescription: "Thiamin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatTotal: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatTotal, shortDescription: "Total Fat", unit: HKUnit.gramUnit(), imageName: "Fat"),
        HKQuantityTypeIdentifierDietaryVitaminA: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminA, shortDescription: "Vitamin A", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminB12: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminB12, shortDescription: "Vitamin B12", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminB6: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminB6, shortDescription: "Vitamin B6", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminC: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminC, shortDescription: "Vitamin C", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminD: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminD, shortDescription: "Vitamin D", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminE: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminE, shortDescription: "Vitamin E", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminK: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminK, shortDescription: "Vitamin K", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryWater: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryWater, shortDescription: "Water", unit: HKUnit.literUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryZinc: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryZinc, shortDescription: "Zinc", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli))
    ]
    
    static func getTypeDescription(typeIdentifier: String) -> String {
        return types[typeIdentifier]!.description
    }
    
    static func getTypeUnitDescription(typeIdentifier: String) -> String {
        return types[typeIdentifier]!.unit.description
    }
    
    static func authorizeHealthKit() -> Bool {
        // Set the types you want to write to HK Store
        var healthKitTypesToWrite: Set<HKQuantityType> = []
        
        for type in orderedTypes {
            healthKitTypesToWrite.insert(HKObjectType.quantityTypeForIdentifier(type)!)
        }
        
        // 3. If the store is not available (for instance, iPad) return an error and don't go on.
        if !HKHealthStore.isHealthDataAvailable() {
            return false;
        }
        
        // 4.  Request HealthKit authorization
        healthKitStore.requestAuthorizationToShareTypes(healthKitTypesToWrite, readTypes: nil) { (success, error) -> Void in
            return success
        }
        return false
    }
    
    static func saveSample(identifier: String, date: NSDate, value: Double, unit: HKUnit, metadata: [String: AnyObject]) -> Bool {
        // 1. Create a Sample
        let type = HKQuantityType.quantityTypeForIdentifier(identifier)
        let quantity = HKQuantity(unit: unit, doubleValue: value)
        let sample = HKQuantitySample(type: type!, quantity: quantity, startDate: date, endDate: date, metadata: metadata)
        
        // 2. Save the sample in the store
        healthKitStore.saveObject(sample, withCompletion: { (success, error) -> Void in
            return error == nil
        })
        return false
    }
}