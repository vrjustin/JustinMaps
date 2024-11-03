//
//  MapViewCoordinator.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import Foundation
import MapKit

final class MapViewCoordinator: NSObject, MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let region = MKCoordinateRegion(center: mapView.userLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.setRegion(region, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let annotation = view.annotation as? PlaceAnnotation else { return }
        
        view.canShowCallout = true
        view.detailCalloutAccessoryView = PlaceCalloutView(annotation: annotation, selectShowDirections: { [weak self] placeAnnotation in
            // show directions to the place in the placeAnnotation
            let start = MKMapItem.forCurrentLocation()
            let destination = MKMapItem(placemark: MKPlacemark(coordinate: placeAnnotation.coordinate))
            
            self?.calculateRoute(start: start, destination: destination)
        })
    }
    
    func calculateRoute(start: MKMapItem, destination: MKMapItem) {
        
        let directionsRequest = MKDirections.Request()
        directionsRequest.transportType = .automobile
        directionsRequest.source = start
        directionsRequest.destination = destination
        
        let directions = MKDirections(request: directionsRequest)
        directions.calculate { response, error in
            
            if let error = error {
                print("Unable to calculate directions: \(error)")
                return
            }
            
            guard let response = response,
                let route = response.routes.first else {
                    return
            }
            
            for step in route.steps {
                print(step.instructions)
            }
            
            
        }
        
    }
    
}
