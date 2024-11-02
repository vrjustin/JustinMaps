//
//  MapView.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import Foundation
import MapKit
import SwiftUI

struct MapView: NSViewRepresentable {
    
    typealias NSViewType = MKMapView
    
    private var annotations: [PlaceAnnotation] = []
    
    init(annotations: [PlaceAnnotation]) {
        self.annotations = annotations
    }
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        map.delegate = context.coordinator
        return map
    }
    
    func updateNSView(_ map: MKMapView, context: Context) {
        
        // remove existing annotations
        map.removeAnnotations(map.annotations)
        
        // add new ones
        map.addAnnotations(annotations)
        
    }
    
    func makeCoordinator() -> MapViewCoordinator {
        MapViewCoordinator()
    }
    
}
