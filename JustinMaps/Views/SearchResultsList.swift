//
//  SearchResultsList.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/1/24.
//

import SwiftUI

struct SearchResultsList: View {
    var body: some View {
        List(1...20, id: \.self) { idx in
            Text("Item: \(idx)")
        }
    }
}

#Preview {
    SearchResultsList()
}
