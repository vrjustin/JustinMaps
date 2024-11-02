//
//  SearchResultsList.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct SearchResultsList: View {
    
    let places: [PlaceAnnotation]
    @StateObject private var locationManager = LocationManager()
    
    func formatDistance(for place: PlaceAnnotation) -> String {
        let distanceInMeters = place.getDistance(userLocation: locationManager.location)
        return distanceInMeters != nil ? "\(String(describing: distanceInMeters!))" : ""
    }
    
    var body: some View {
        List(places) { place in
            VStack(alignment: .leading) {
                Text(place.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(formatDistance(for: place))
                    .font(.caption)
                    .opacity(0.4)
            }
        }
    }
}

#Preview {
    SearchResultsList(places: [])
}
