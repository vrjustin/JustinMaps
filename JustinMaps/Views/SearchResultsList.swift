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
    
    @AppStorage("distanceUnit") private var distanceUnit: DistanceUnit = .miles
    @StateObject private var locationManager = LocationManager()
    
    private var distanceFormatter = DistanceFormatter()
    
    init(places: [PlaceAnnotation], onSelect: @escaping (PlaceAnnotation) -> Void) {
        self.places = places
        self.onSelect = onSelect
    }
    
    func formatDistance(for place: PlaceAnnotation) -> String {
        guard let distanceInMeters = place.getDistance(userLocation: locationManager.location) else {
            return "Unknown"
        }
        
        distanceFormatter.unitOptions = distanceUnit
        return distanceFormatter.format(distanceInMeters: distanceInMeters)
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
