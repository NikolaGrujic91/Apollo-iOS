//
//  WeightRepository.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 07/02/2023.
//

import FoundationLogger
import FoundationStorage

@MainActor
final class WeightRepository: WeightRepositoryProtocol, LoggerInjected, StorageInjected {
    // MARK: - Properties

    private(set) var bodyMass: Double = 0.0 {
        didSet {
            bodyMassFormatted = "\(String(format: "%.1f", bodyMass))"
            logger.logInfo("Body mass: \(bodyMassFormatted)")
        }
    }
    private(set) var bodyMassFormatted: String = ""
    private let key: String = "ApolloWeight"
    private let healthKitRepository = HealthKitRepository()

    // MARK: - Initializers

    init() {
        load()
    }

    // MARK: - WeightRepositoryProtocol

    func save(_ value: Double) {
        storage.set(value, forKey: key)
        bodyMass = value
    }

    func load() {
        bodyMass = storage.get(forKey: key)
    }

    func loadFromHealthKit() async {
        do {
            try await healthKitRepository.requestAuthorization()
            try await healthKitRepository.fetchWeight()
            save(healthKitRepository.bodyMass)
        } catch {
            logger.handleError(error)
        }
    }
}
