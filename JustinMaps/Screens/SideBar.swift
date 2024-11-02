//
//  SideBar.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct SideBar: View {
    
    private var vm = SearchResultsViewModel()
    
    @State private var search: String = ""
    @EnvironmentObject var appState: AppState
    
    
    var body: some View {
        VStack {
            SearchResultsList(places: appState.places) { placeAnnotation in
                appState.selectedPlace = placeAnnotation
                print(placeAnnotation.title)
            }
        }
        .searchable(text: $search, placement: .sidebar, prompt: "Search Maps")
        .onChange(of: search) { value in
            vm.search(text: search) { places in
                appState.places = places
            }
        }
        .padding()
    }
}

#Preview {
    SideBar()
}
