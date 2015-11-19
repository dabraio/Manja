//
//  Meal.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import Foundation

class Meal: NSObject, NSCopying, NSCoding {
    // MARK: Types
    struct PropertyKey {
        static let name = "Manja.Meal.name"
        static let category = "Manja.Meal.category"
        static let facts = "Manja.Meal.facts"
        static let referenceServing = "Manja.Meal.referenceServing"
        static let serving = "Manja.Meal.serving"
    }
    
    // MARK: Properties
    var name: String
    var category: String
    var facts: [NutritionFact]
    var referenceServing: Double
    var serving: Double
    var timestamp: NSDate?
    
    // MARK: Archiving Paths
    /*static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Meal")*/
    
    // MARK: Initialization
    init?(name: String, category: String, facts: [NutritionFact], referenceServing: Double, serving: Double) {
        // Initialize stored properties.
        self.name = name
        self.category = category
        self.facts = facts
        self.referenceServing = referenceServing
        self.serving = serving
        
        // Must call superclass initilizer.
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || category.isEmpty || facts.isEmpty || referenceServing < 0.01 || serving < 0.01 {
            return nil
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Meal(name: name, category: category, facts: facts, referenceServing: referenceServing, serving: serving)!
        return copy
    }
    
    override init() {
        name = ""
        category = ""
        facts = []
        for typeIdentifier in HealthKitManager.orderedTypes {
            facts.append(NutritionFact(typeIdentifier: typeIdentifier, value: 0))
        }
        referenceServing = 100
        serving = 200
        timestamp = nil
    }
    
    func newValueForTypeAtPosition(position: Int) -> Double {
        return facts[position].value * serving / referenceServing
    }
    
    func sendToHealth() {
        for fact in facts {
            let value = fact.value * serving / referenceServing
            if value > 0 {
                HealthKitManager.saveSample(fact.typeIdentifier, date: timestamp!, value: value, unit: HealthKitManager.types[fact.typeIdentifier]!.unit, metadata: ["Meal Name": self.name, "Serving Size": self.serving])
            }
        }
    }
    
    func restoreEmptyFacts() {
        var newFacts: [NutritionFact] = []
        
        for typeIdentifier in HealthKitManager.orderedTypes {
            var found: Bool = false
            for oldFact in facts {
                if oldFact.typeIdentifier == typeIdentifier {
                    newFacts.append(oldFact)
                    found = true
                    break
                }
            }
            if !found {
                newFacts.append(NutritionFact(typeIdentifier: typeIdentifier, value: 0))
            }
        }
        
        facts = newFacts
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.name)
        aCoder.encodeObject(category, forKey: PropertyKey.category)
        aCoder.encodeObject(facts, forKey: PropertyKey.facts)
        aCoder.encodeDouble(referenceServing, forKey: PropertyKey.referenceServing)
        aCoder.encodeDouble(serving, forKey: PropertyKey.serving)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.name) as! String
        let category = aDecoder.decodeObjectForKey(PropertyKey.category) as! String
        let facts = aDecoder.decodeObjectForKey(PropertyKey.facts) as! [NutritionFact]
        let referenceServing = aDecoder.decodeDoubleForKey(PropertyKey.referenceServing)
        let serving = aDecoder.decodeDoubleForKey(PropertyKey.serving)
        self.init(name: name, category: category, facts: facts, referenceServing: referenceServing, serving: serving)
    }
}
