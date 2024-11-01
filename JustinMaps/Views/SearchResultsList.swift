//
//  SearchResultsList.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct SearchResultsList: View {
    
    let places: [PlaceAnnotation]
    
    var body: some View {
        List(places) { place in
            Text(place.title ?? "")
        }
    }
}

#Preview {
    SearchResultsList(places: [])
}
