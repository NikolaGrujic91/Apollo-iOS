//
//  WeightViewModel.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 19/02/2023.
//

import Observation

@Observable
public final class WeightViewModel: WeightServiceInjected {
    public var bodyMass: String = "0.0"

    public init() {
        bodyMass = service.load()
    }

    func save() {
        bodyMass = service.save(bodyMass)
    }

    func loadFromHealth() async {
        bodyMass = await service.loadFromHealthKit()
    }
}
