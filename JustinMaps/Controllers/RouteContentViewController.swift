//
//  RouteContentViewController.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/3/24.
//

import Foundation
import AppKit
import MapKit

class RouteContentViewController: NSViewController {
    
    private var route: MKRoute
    
    init(route: MKRoute) {
        self.route = route
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = RouteCalloutView(route: route)
    }
    
    
}
