//
//  WeightService.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 04/10/2023.
//

final class WeightService: WeightServiceProtocol, WeightRepositoryInjected {
    // MARK: - WeightServiceProtocol

    func save(_ bodyMass: String) -> String {
        repository.save(Double(bodyMass) ?? 0.0)
        return repository.bodyMassFormatted
    }

    func load() -> String {
        repository.load()
        return repository.bodyMassFormatted
    }

    func loadFromHealthKit() async -> String {
        await repository.loadFromHealthKit()
        return repository.bodyMassFormatted
    }
}
