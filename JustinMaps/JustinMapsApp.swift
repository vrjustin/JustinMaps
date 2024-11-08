//
//  JustinMapsApp.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

@main
struct JustinMapsApp: App {
    var body: some Scene {
        WindowGroup {
            let appState = AppState()
            HomeScreen()
                .frame(minWidth: 1280, minHeight: 720)
                .environmentObject(appState)
        }
        .commands {
            CommandGroup(after: .appInfo) {
                Button("Preferences") {
                    PreferencesScreen()
                        .openInWindow(title: "Preferences", sender: self)
                }
            }
        }
    }
}
