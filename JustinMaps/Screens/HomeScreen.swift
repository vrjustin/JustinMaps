//
//  HomeScreen.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false
    
    private func toggleSidebar() {
            NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
    
    var body: some View {
        NavigationView {
            Group {
                SideBar()
                    .frame(minWidth: 200)
                MapScreen()
            }
            .preferredColorScheme(useLightMap ? .light : .dark)
            
        }
        .toolbar {
            ToolbarItem(placement: .navigation) {
                Button(action: toggleSidebar) {
                    Image(systemName: "sidebar.left")
                }
            }
        }
    }
}

#Preview {
    HomeScreen()
        .environmentObject(AppState())
}
