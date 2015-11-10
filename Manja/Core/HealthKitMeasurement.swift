//
//  HealthKitMeasurement.swift
//  Manja
//
//  Created by Faustino da Silva on 09/11/2015.
//  Copyright © 2015 Faustino Dabraio da Silva. All rights reserved.
//

import UIKit

class HealthKitMeasurement : NSObject, NSCoding {
    // MARK: Propertirs
    let identifier: String
    let name: String
    var value: Double?
    
    // MARK: Archiving Paths
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("manja")
    
    // MARK: Types
    struct PropertyKey {
        static let identifierKey = "identifier"
        static let nameKey = "name"
        static let valueKey = "value"
    }

    // MARK: Initialization
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Must call superclass initilizer.
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
}
