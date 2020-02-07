//
//  Bar.swift
//  De Bar em Bar
//
//  Created by Jonathan on 03/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit
import os.log

class Bar: NSObject, NSCoding {
    
    //MARK: Properties
    
    var name: String
    var address: String
    var phone: String
    var photo: UIImage?
    var rating: Int
    var longitude: Double
    var latitude: Double
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("bares")
    
    //MARK: Types
    
    struct PropertyKey {
        static let name = "name"
        static let address = "address"
        static let phone = "phone"
        static let photo = "photo"
        static let rating = "rating"
        static let longitude = "longitute"
        static let latitude = "latitude"
    }
    
    
    //MARK: Initialization
    
    init?(name: String, address: String, phone: String, photo: UIImage?, rating: Int, longitude: Double, latitude: Double) {
        
        // The fields must not be empty
        guard (!name.isEmpty) && (!address.isEmpty) && (!phone.isEmpty) else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // The longitude should range from -180 to 180 degrees
        guard (longitude >= -180) && (longitude <= 180) else {
            return nil
        }
        
        // The latitude should range from -90 to 90 degrees
        guard (latitude >= -90) && (latitude <= 90) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.address = address
        self.phone = phone
        self.photo = photo
        self.rating = rating
        self.longitude = longitude
        self.latitude = latitude
    }
    
    //MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(address, forKey: PropertyKey.address)
        aCoder.encode(phone, forKey: PropertyKey.phone)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
        aCoder.encode(latitude, forKey: PropertyKey.latitude)
        aCoder.encode(longitude, forKey: PropertyKey.longitude)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Bar object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let address = aDecoder.decodeObject(forKey: PropertyKey.address) as? String
        
        let phone = aDecoder.decodeObject(forKey: PropertyKey.phone) as? String
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        let longitude = aDecoder.decodeDouble(forKey: PropertyKey.longitude)
        
        let latitude = aDecoder.decodeDouble(forKey: PropertyKey.latitude)
        
        self.init(name: name, address: address!, phone: phone!, photo: photo, rating: rating, longitude: longitude, latitude: latitude)
    }
    
    
}
