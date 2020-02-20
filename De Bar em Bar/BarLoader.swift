//
//  BarLoader.swift
//  De Bar em Bar
//
//  Created by Jonathan on 20/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import Foundation
import MapKit

class BarLoader{
    static func loadSampleBares() -> [Bar]{
        let photo1 = UIImage(named: "bar1")
        let photo2 = UIImage(named: "bar2")
        let photo3 = UIImage(named: "bar3")
        
        guard let bar1 = Bar(name: "Andre Fumante", address: "Timbo", phone: "3382 9038", photo: photo1, rating: 3, coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0)) else {
            fatalError("Unable to instantiate bar1")
        }
        
        guard let bar2 = Bar(name: "TORA", address: "Balneario", phone: "3382 9038", photo: photo2, rating: 4,  coordinate: CLLocationCoordinate2D(latitude: 0.002, longitude: 0.002)) else {
            fatalError("Unable to instantiate bar2")
        }
        
        guard let bar3 = Bar(name: "TÁ CHOVENDO HAMBURGUER", address: "Londres", phone: "3382 9038", photo: photo3, rating: 1, coordinate: CLLocationCoordinate2D(latitude: 0.004, longitude: 0.004)) else {
            fatalError("Unable to instantiate bar3")
        }
        
       return [bar1, bar2, bar3]
    }
    
    
    
}
