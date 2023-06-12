//
//  Place.swift
//  MapsIntro
//
//  Created by Philip Andersson on 2023-06-08.
//

import Foundation
import CoreLocation

struct Place : Identifiable {
    var id = UUID()
    
    var name : String
    var latitude : Double
    var longitude : Double
    
    var coordinate : CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
}
