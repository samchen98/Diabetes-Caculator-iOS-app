//
//  Meal.swift
//  FoodTracker
//
//  Created by Jane Appleseed on 11/10/16.
//  Copyright © 2016 Apple Inc. All rights reserved.
//

import UIKit
import os.log


class SugarData: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String

   
    var timeStamp: String
    
    //MARK: Archiving Paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("sugars")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let timeStamp = "timeStamp"
    }
    
    //MARK: Initialization
    
    init?(name: String, timeStamp: String) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        // Initialization should fail if there is no name or if the rating is negative.
        
        // Initialize stored properties.
        self.name = name
        self.timeStamp = timeStamp
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(timeStamp, forKey: PropertyKey.timeStamp)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
                guard let timeStamp = aDecoder.decodeObject(forKey: PropertyKey.timeStamp) as? String
            else{
                return nil
        }
        
        // Must call designated initializer.
        self.init(name: name, timeStamp: timeStamp)
        
    }
}

