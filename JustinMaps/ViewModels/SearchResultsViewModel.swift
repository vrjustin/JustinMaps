//
//  SearchResultsViewModel.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import Foundation
import MapKit

class SearchResultsViewModel {
    
    private let locationManager = LocationManager()
    
    func search(text: String, completion: @escaping ([PlaceAnnotation]) -> Void) {
        
        if text.count < 4 {
            completion([])
            return
        }
        
        let searchRequest = MKLocalSearch.Request()
        searchRequest.naturalLanguageQuery = text
        searchRequest.region = locationManager.region
        
        let search = MKLocalSearch(request: searchRequest)
        search.start { response, error in
            
            guard let response = response, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown Error")")
                completion([])
                return
            }
            
            let places = response.mapItems.map(PlaceAnnotation.init)
            completion(places)
        }
        
    }
    
}
