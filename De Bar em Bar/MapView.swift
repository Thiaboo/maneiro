//
//  MapView.swift
//  De Bar em Bar
//
//  Created by Jonathan on 18/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
            mapView.setRegion(coordinateRegion, animated: true)
            centerMapOnLocation(location: initialLocation)
        }
    }
    
    class Artwork: NSObject, MKAnnotation {
        let title: String?
        let locationName: String
        let discipline: String
        let coordinate: CLLocationCoordinate2D
        
        init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.locationName = locationName
            self.discipline = discipline
            self.coordinate = coordinate
            
            super.init()
            
        }
        
        var subtitle: String? {
            return locationName
            
            
        }
        
        class Artwork: NSObject, MKAnnotation {
            let title: String?
            let locationName: String
            let discipline: String
            let coordinate: CLLocationCoordinate2D
            
            init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
                self.title = title
                self.locationName = locationName
                self.discipline = discipline
                self.coordinate = coordinate
                
                super.init()
            }
            
            var subtitle: String? {
                return locationName
            }
        }
    }
    
    

   

}
