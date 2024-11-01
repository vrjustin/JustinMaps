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
    
    
    var body: some View {
        VStack {
            SearchResultsList()
        }
        .searchable(text: $search, placement: .sidebar, prompt: "Search Maps")
        .onChange(of: search) { value in
            vm.search(text: search) {
                
            }
        }
        .padding()
    }
}

#Preview {
    SideBar()
}
