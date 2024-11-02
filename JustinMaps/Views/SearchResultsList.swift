//
//  SearchResultsList.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct SearchResultsList: View {
    
    let places: [PlaceAnnotation]
    var onSelect: (PlaceAnnotation) -> Void
    
    @StateObject private var locationManager = LocationManager()
    
    init(places: [PlaceAnnotation], onSelect: @escaping (PlaceAnnotation) -> Void) {
        self.places = places
        self.onSelect = onSelect
    }
    
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
            .contentShape(Rectangle())
            .onTapGesture {
                onSelect(place)
            }
        }
    }
}

#Preview {
    SearchResultsList(places: [], onSelect: { _ in})
}
