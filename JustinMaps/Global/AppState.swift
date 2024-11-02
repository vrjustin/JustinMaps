//
//  AppState.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import Foundation

class AppState: ObservableObject {
    @Published var places: [PlaceAnnotation] = []
    @Published var selectedPlace: PlaceAnnotation?
}
