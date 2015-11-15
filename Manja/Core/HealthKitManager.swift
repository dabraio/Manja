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
    
    struct TypeInfo {
        let identifier: String
        let description: String
        let unit: HKUnit
        
        func fullDescription() -> String {
            return "\(description) (\(unit.description))"
        }
        
        func unitDescription() -> String {
            return unit.description
        }
    }
    
    static let types: [String: TypeInfo] = [
        HKQuantityTypeIdentifierDietaryBiotin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryBiotin, description: "Biotin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryCaffeine: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCaffeine, description: "Caffeine", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryCalcium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCalcium, description: "Calcium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryCarbohydrates: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCarbohydrates, description: "Carbohydrates", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryChloride: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryChloride, description: "Chloride", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryChromium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryChromium, description: "Chromium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryCopper: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCopper, description: "Copper", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryEnergyConsumed: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryEnergyConsumed, description: "Dietary Calories", unit: HKUnit.kilocalorieUnit()),
        HKQuantityTypeIdentifierDietaryCholesterol: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryCholesterol, description: "Dietary Cholesterol", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietarySugar: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySugar, description: "Dietary Sugar", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryFiber: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFiber, description: "Fibre", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryFolate: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFolate, description: "Folate", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryIodine: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryIodine, description: "Iodine", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryIron: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryIron, description: "Iron", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryMagnesium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryMagnesium, description: "Magnesium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryManganese: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryManganese, description: "Manganese", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryMolybdenum: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryMolybdenum, description: "Molybdenum", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryFatMonounsaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatMonounsaturated, description: "Monounsaturated Fat", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryNiacin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryNiacin, description: "Niacin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryPantothenicAcid: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPantothenicAcid, description: "Pantothenic Acid", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryPhosphorus: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPhosphorus, description: "Phosphorus", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatPolyunsaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatPolyunsaturated, description: "Polyunsaturated Fat", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryPotassium: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryPotassium, description: "Potassium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryProtein: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryProtein, description: "Protein", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryRiboflavin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryRiboflavin, description: "Riboflavin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatSaturated: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatSaturated, description: "Saturated Fat", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietarySelenium: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySelenium, description: "Selenium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietarySodium: TypeInfo(identifier: HKQuantityTypeIdentifierDietarySodium, description: "Sodium", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryThiamin: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryThiamin, description: "Thiamin", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryFatTotal: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryFatTotal, description: "Total Fat", unit: HKUnit.gramUnit()),
        HKQuantityTypeIdentifierDietaryVitaminA: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminA, description: "Vitamin A", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminB12: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminB12, description: "Vitamin B12", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminB6: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminB6, description: "Vitamin B6", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminC: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminC, description: "Vitamin C", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminD: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminD, description: "Vitamin D", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryVitaminE: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminE, description: "Vitamin E", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryVitaminK: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryVitaminK, description: "Vitamin K", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Micro)),
        HKQuantityTypeIdentifierDietaryWater: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryWater, description: "Water", unit: HKUnit.literUnitWithMetricPrefix(HKMetricPrefix.Milli)),
        HKQuantityTypeIdentifierDietaryZinc: TypeInfo(identifier: HKQuantityTypeIdentifierDietaryZinc, description: "Zinc", unit: HKUnit.gramUnitWithMetricPrefix(HKMetricPrefix.Milli))
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
        
        let typesToWrite = Array(types.keys)
        for type in typesToWrite {
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