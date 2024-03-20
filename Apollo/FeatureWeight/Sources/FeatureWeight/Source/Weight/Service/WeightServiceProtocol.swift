//
//  WeightServiceProtocol 3.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 04/10/2023.
//

@MainActor
protocol WeightServiceProtocol: AnyObject {
    ///
    /// Save weight data to user defaults.
    ///
    func save(_ bodyMass: String) -> String

    ///
    /// Load weight data from user defaults
    ///
    func load() -> String

    ///
    /// Load weight data from HealthKit
    ///
    func loadFromHealthKit() async -> String
}
