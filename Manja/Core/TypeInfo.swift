//
//  TypeInfo.swift
//  Manja
//
//  Created by Faustino da Silva on 15/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import Foundation
import HealthKit

class TypeInfo: NSObject, NSCoding {
    // MARK: Types
    struct PropertyKey {
        static let identifier = "Manja.TypeInfo.identifier"
        static let shortDescription = "Manja.TypeInfo.shortDescription"
        static let unit = "Manja.TypeInfo.unit"
        static let imageName = "Manja.TypeInfo.imageName"
    }
    
    // MARK: Properties
    let identifier: String
    let shortDescription: String
    let unit: HKUnit
    let imageName: String
    
    func fullDescription() -> String {
        return "\(shortDescription) (\(unit.description))"
    }
    
    func unitDescription() -> String {
        return unit.description
    }
    
    init(identifier: String, shortDescription: String, unit: HKUnit, imageName: String?) {
        self.identifier = identifier
        self.shortDescription = shortDescription
        self.unit = unit
        self.imageName = imageName == nil ? "Auto" : imageName!
        super.init()
    }
    
    convenience init(identifier: String, shortDescription: String, unit: HKUnit) {
        self.init(identifier: identifier, shortDescription: shortDescription, unit: unit, imageName: nil)
    }
    
    // MARK: NSCoding
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(identifier, forKey: PropertyKey.identifier)
        aCoder.encodeObject(shortDescription, forKey: PropertyKey.shortDescription)
        aCoder.encodeObject(unit, forKey: PropertyKey.unit)
        aCoder.encodeObject(imageName, forKey: PropertyKey.imageName)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let identifier = aDecoder.decodeObjectForKey(PropertyKey.identifier) as! String
        let shortDescription = aDecoder.decodeObjectForKey(PropertyKey.shortDescription) as! String
        let unit = aDecoder.decodeObjectForKey(PropertyKey.unit) as! HKUnit
        let imageName = aDecoder.decodeObjectForKey(PropertyKey.imageName) as? String
        self.init(identifier: identifier, shortDescription: shortDescription, unit: unit, imageName: imageName)
    }
}
