//
//  DistanceFormatter.swift
//  JustinMaps
//
//  Created by Justin Maronde on 11/4/24.
//

import Foundation

class DistanceFormatter {
    
    var unitOptions: DistanceUnit = .miles
    
    func format(distanceInMeters: Double) -> String {
        
        switch unitOptions {
        case .miles:
            return formatForMiles(distanceInMeters)
        case .kilometers:
            return formatForKilometers(distanceInMeters)
        }
        
    }
    
    private func formatForMiles(_ distanceInMeters: Double) -> String {
        switch distanceInMeters {
        case 0...182:
            return distanceInMeters.toFeet().displayDistance(.feet)
        case 183...:
            return distanceInMeters.toMiles().displayDistance(.miles)
        default:
            return distanceInMeters.toFeet().displayDistance(.feet)
        }
    }
    
    private func formatForKilometers(_ distanceInMeters: Double) -> String {
        switch distanceInMeters {
        case 0...900:
            return distanceInMeters.toMeters().displayDistance(.meters)
        case 901...:
            return distanceInMeters.toKilometers().displayDistance(.kilometers)
        default:
            return distanceInMeters.toMeters().displayDistance(.meters)
        }
    }
    
}
