//
//  ActivityStats.swift
//  FeaturePlans
//
//  Created by Nikola Grujic on 26/03/2024.
//

final class ActivityStats {
    private(set) var distanceKilometers: String = "0.00"
    private(set) var calories: Int = 0
    private(set) var pace: Double = 0.0
    private(set) var paceFormatted: String = "00:00"

    func setDistanceKilometersFormatted(_ distanceKilometers: Double) {
        self.distanceKilometers = String(format: "%.2f", distanceKilometers)
    }

    func setCalories(_ distanceKilometers: Double, _ bodyMass: Double) {
        calories = Int(distanceKilometers * bodyMass * 1.036)
    }

    func setPace(_ timeElapsed: Int, _ distanceKilometers: Double) {
        pace = Double(timeElapsed) / distanceKilometers
        paceFormatted = String(format: "%02i:%02i", Int(pace) / 60 % 60, Int(pace) % 60)
    }
}
