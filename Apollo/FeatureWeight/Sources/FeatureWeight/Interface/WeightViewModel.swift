//
//  WeightViewModel.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 19/02/2023.
//

import Observation

@Observable
@MainActor
public final class WeightViewModel: WeightServiceInjected {
    // MARK: - Properties

    public var bodyMass: String = "0.0"

    // MARK: - Initializers

    public init() {
        bodyMass = service.load()
    }

    // MARK: - Functions

    func save() {
        bodyMass = service.save(bodyMass)
    }

    func loadFromHealth() async {
        bodyMass = await service.loadFromHealthKit()
    }
}
