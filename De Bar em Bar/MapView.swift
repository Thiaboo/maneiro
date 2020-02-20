//
//  MapView.swift
//  De Bar em Bar
//
//  Created by Jonathan on 18/02/20.
//  Copyright © 2020 hbsis. All rights reserved.
//

import UIKit
import MapKit
import os.log



class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    
    var bares = [Bar]()
    
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedBares = loadBares() {
            bares += savedBares
        } else {
            loadSampleBares()
        }
        
        // set initial location in Honolulu
        let initialLocation = CLLocation(latitude: 0, longitude: 0)
        centerMapOnLocation(location: initialLocation)
        
        for bar in bares{
        mapView.addAnnotation(bar)
        }
        
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    private func loadBares() -> [Bar]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Bar.ArchiveURL.path) as? [Bar]
    }
    private func loadSampleBares(){
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
        
        bares += [bar1, bar2, bar3]
    }
    static func saveBares(bares: [Bar?]) {
        let isSucessfulSave = NSKeyedArchiver.archiveRootObject(bares, toFile: Bar.ArchiveURL.path)
        
        if isSucessfulSave {
            os_log("Bares salvos com sucesso.", log: OSLog.default, type: .debug)
        } else {
            os_log("Tentativa de salvar bares falhou...", log: OSLog.default, type: .error)
        }
    }
    //Carregar o bar
    static func loadBares() -> [Bar]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Bar.ArchiveURL.path) as? [Bar]
    }
    
    
    
}
