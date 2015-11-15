//
//  Meal.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCopying {
    struct Fact {
        var typeIdentifier: String
        var value: Double
    }
    
    // MARK: Properties
    var name: String
    var category: String
    var facts: [Fact]
    var referenceServing: Double
    var serving: Double
    var timestamp: NSDate?
    
    // MARK: Initialization
    init?(name: String, category: String, facts: [Fact], referenceServing: Double, serving: Double) {
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
        //var fake = 1.0
        for typeIdentifier in HealthKitManager.orderedTypes {
            facts.append(Fact(typeIdentifier: typeIdentifier, value: 0))
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
            HealthKitManager.saveSample(fact.typeIdentifier, date: timestamp!, value: fact.value * serving / referenceServing, unit: HealthKitManager.types[fact.typeIdentifier]!.unit, metadata: ["Meal Name": self.name, "Serving Size": self.serving])
        }
    }
}
