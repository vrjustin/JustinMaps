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
        view.detailCalloutAccessoryView = PlaceCalloutView(annotation: annotation)
    }
    
}
