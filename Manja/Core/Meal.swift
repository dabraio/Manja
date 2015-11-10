//
//  Meal.swift
//  Manja
//
//  Created by Faustino da Silva on 07/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class Meal : NSObject, NSCopying {
    // MARK: Properties
    var name: String
    var facts: [String: Double]
    var referenceServing: Double
    var serving: Double
    var timestamp: NSDate?
    
    // MARK: Initialization
    init?(name: String, facts: [String: Double], referenceServing: Double, serving: Double) {
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
    
    func newValueForType(typeIdentifier: String) -> Double {
        return facts[typeIdentifier]! * serving / referenceServing
    }
}
