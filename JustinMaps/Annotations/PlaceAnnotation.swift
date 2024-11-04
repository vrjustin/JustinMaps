//
//  PlaceAnnotation.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import Foundation
import MapKit
import Contacts

class PlaceAnnotation: NSObject, MKAnnotation, Identifiable {
    
    let id = UUID()
    private var mapItem: MKMapItem
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
    
    var title: String? {
        mapItem.name
    }
    
    var phone: String {
        mapItem.phoneNumber ?? "No phone number available"
    }
    
    var address: String {
        guard let postalAddress = mapItem.placemark.postalAddress else {
            return "No address available"
        }
        
        return "\(postalAddress.street), (\(postalAddress.city), \(postalAddress.state), \(postalAddress.postalCode)"
    }
    
    var location: CLLocation? {
        return CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    var coordinate: CLLocationCoordinate2D {
        mapItem.placemark.coordinate
    }
    
    var city: String {
        mapItem.placemark.locality ?? "No city available"
    }
    
    func getDistance(userLocation: CLLocation?) -> Double? {
        guard let placeLocation = mapItem.placemark.location,
              let userLocation = userLocation else {
            return nil
        }
        return userLocation.distance(from: placeLocation)
    }
    
}
