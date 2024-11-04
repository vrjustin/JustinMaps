//
//  DistanceUnit.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/4/24.
//

import Foundation

enum DistanceUnit: String, Codable, CaseIterable {
    case miles
    case kilometers
}

extension DistanceUnit {
    var title: String {
        switch self {
        case .miles:
            return "Miles"
        case .kilometers:
            return "Kilometers"
        }
    }
}
