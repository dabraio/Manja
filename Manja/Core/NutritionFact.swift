//
//  NutritionFact.swift
//  Manja
//
//  Created by Faustino da Silva on 15/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import Foundation

class NutritionFact: NSObject, NSCoding {
    // MARK: Types
    struct PropertyKey {
        static let typeIdentifier = "Manja.Meal.typeIdentifier"
        static let value = "Manja.Meal.value"
    }
    
    // MARK: Properties
    var typeIdentifier: String
    var value: Double
    
    init(typeIdentifier: String, value: Double) {
        self.typeIdentifier = typeIdentifier
        self.value = value
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(typeIdentifier, forKey: PropertyKey.typeIdentifier)
        aCoder.encodeDouble(value, forKey: PropertyKey.value)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let typeIdentifier = aDecoder.decodeObjectForKey(PropertyKey.typeIdentifier) as! String
        let value = aDecoder.decodeDoubleForKey(PropertyKey.value)
        self.init(typeIdentifier: typeIdentifier, value: value)
    }
}
