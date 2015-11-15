//
//  Category.swift
//  Manja
//
//  Created by Faustino da Silva on 15/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class Category: NSObject, NSCoding {
    // MARK: Properties
    var name: String
    var meals: [Meal]
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("Manja.Category")
    
    // MARK: Types
    struct PropertyKey {
        static let name = "Manja.Category.name"
        static let meals = "Manja.Category.meals"
    }
    
    init(name: String, meals: [Meal]) {
        self.name = name
        self.meals = meals
        super.init()
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.name)
        aCoder.encodeObject(meals, forKey: PropertyKey.meals)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.name) as! String
        let meals = aDecoder.decodeObjectForKey(PropertyKey.meals) as! [Meal]
        self.init(name: name, meals: meals)
    }
}
