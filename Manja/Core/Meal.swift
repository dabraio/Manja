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
    var facts: [Fact]
    var referenceServing: Double
    var serving: Double
    var timestamp: NSDate?
    
    // MARK: Initialization
    init?(name: String, facts: [Fact], referenceServing: Double, serving: Double) {
        // Initialize stored properties.
        self.name = name
        self.facts = facts
        self.referenceServing = referenceServing
        self.serving = serving
        
        // Must call superclass initilizer.
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || facts.isEmpty || referenceServing < 0.01 || serving < 0.01 {
            return nil
        }
    }
    
    func copyWithZone(zone: NSZone) -> AnyObject {
        let copy = Meal(name: name, facts: facts, referenceServing: referenceServing, serving: serving)!
        return copy
    }
    
    /*func newValueForType(typeIdentifier: String) -> Double {
        for fact: Fact in facts {
            if fact.typeIdentifier == typeIdentifier {
                return fact.value * serving / referenceServing
            }
        }
        return 0
    }*/
    
    func newValueForTypeAtPosition(position: Int) -> Double {
        return facts[position].value * serving / referenceServing
    }
    
    func sendToHealth() {
        for fact in facts {
            HealthKitManager.saveSample(fact.typeIdentifier, date: timestamp!, value: fact.value * serving / referenceServing, unit: HealthKitManager.types[fact.typeIdentifier]!.unit)
        }
    }
}
