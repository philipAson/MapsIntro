//
//  ContentView.swift
//  MapsIntro
//
//  Created by Philip Andersson on 2023-06-08.
//

import SwiftUI
import MapKit

struct ContentView: View {
    var locationManager = LocationManager()
    
    @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.3323341, longitude: -122.0312186), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    @ State var places = [
        Place(name: "nice place", latitude: 37.332, longitude: -122.032),
        Place(name: "nicer place", latitude: 37.331, longitude: -122.03),
        Place(name: "nicest place", latitude: 37.332, longitude: -122.033)
        ]
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region,
                interactionModes: [.all],
                // SHOW LIVE TRACKING
                showsUserLocation: true,
                userTrackingMode: .constant(.follow),
                annotationItems: places) { place in
                //MapMarker(coordinate: place.coordinate)
                //MapPin(coordinate: place.coordinate)
                MapAnnotation(coordinate: place.coordinate, anchorPoint:
                                CGPoint(x: 0.5, y: 0.5)) {
                    MapPinView(place: place)
                }
            }
            Button(action: {
                addPin()
            }) {
                Text("add pin")
            }
            Button(action: {
                locationManager.startLocationUpdates()
            }) {
                Text("start updates")
            }
        }
        
    }
    
    // ADD A PIN ON MAP
    func addPin() {
//        let newPlace = Place(name: "new place", latitude: 37.332, longitude: -122.027)
//        places.append(newPlace)
        
        if let location = locationManager.location {
            let newPlace = Place(name: "here", latitude: location.latitude, longitude: location.longitude)
            
            places.append(newPlace)
        }
    }
}

// CUSTOM PIN
struct MapPinView: View {
    var place : Place
    
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 30, height: 30)
            Text(place.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
