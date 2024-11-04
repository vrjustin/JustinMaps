//
//  PreferencesScreen.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/4/24.
//

import SwiftUI

struct PreferencesScreen: View {
    
    @AppStorage("useLightMap") var useLightMap: Bool = false
    @AppStorage("distanceUnit") var distanceUnit = DistanceUnit.miles
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Toggle(isOn: $useLightMap) {
                Text("Always use light map appearance")
            }
            
            Divider()
            
            HStack {
                Text("Distance Units")
                Picker("", selection: $distanceUnit) {
                    ForEach(DistanceUnit.allCases, id: \.self) { distanceUnit in
                        Text(distanceUnit.title)
                    }
                }
                .fixedSize()
                .padding(.trailing, 20)
                
            }
        }
        .padding()
        .frame(minWidth: 400, minHeight: 400)
    }
}

#Preview {
    PreferencesScreen()
}
