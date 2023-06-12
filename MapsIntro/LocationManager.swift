//
//  LocationManager.swift
//  MapsIntro
//
//  Created by Philip Andersson on 2023-06-12.
//

import Foundation
import CoreLocation

class LocationManager : NSObject , CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    var location : CLLocationCoordinate2D?
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func startLocationUpdates() {
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.first?.coordinate
        print("plats uppdaterad \(location)")
    }
    
}
