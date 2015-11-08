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
    
    static func authorizeHealthKit() -> Bool {
        // Set the types you want to write to HK Store
        let healthKitTypesToWrite: Set<HKQuantityType> = [HKObjectType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryWater)!]
        
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
    
    static func saveSample(identifier: String, date: NSDate, value: Double) -> Bool {
        // 1. Create a Sample
        let type = HKQuantityType.quantityTypeForIdentifier(HKQuantityTypeIdentifierDietaryWater)
        let quantity = HKQuantity(unit: HKUnit.literUnit(), doubleValue: value)
        let sample = HKQuantitySample(type: type!, quantity: quantity, startDate: date, endDate: date)
        
        // 2. Save the sample in the store
        healthKitStore.saveObject(sample, withCompletion: { (success, error) -> Void in
            return error == nil
        })
        return false
    }
}