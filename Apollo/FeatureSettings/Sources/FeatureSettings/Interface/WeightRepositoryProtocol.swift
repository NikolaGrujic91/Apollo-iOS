//
//  WeightRepositoryProtocol.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 07/02/2023.
//

public protocol WeightRepositoryProtocol: AnyObject {
    var bodyMass: Double { get }

    ///
    /// Save weight data to user defaults.
    ///
    func save(_ value: Double)

    ///
    /// Load weight data from user defaults
    ///
    func load()

    ///
    /// Load weight data from HealthKit
    ///
    func loadFromHealthKit() async
}
