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
    
    func makeNSView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.showsUserLocation = true
        return map
    }
    
    func updateNSView(_ nsView: MKMapView, context: Context) {
        
    }
    
}
