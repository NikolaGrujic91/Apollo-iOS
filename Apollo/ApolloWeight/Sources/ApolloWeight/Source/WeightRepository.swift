//
//  WeightRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import ApolloLogger
import Foundation

final class WeightRepository: WeightRepositoryProtocol, LoggerInjected {
    // MARK: - Properties

    var bodyMass: Double = 0.0
    private let key: String = "ApolloWeight"
    private let healthKitRepository = HealthKitRepository()

    // MARK: - Initializers

    init() {
        load()
    }

    // MARK: - WeightRepositoryProtocol

    func save(_ value: Double) {
        bodyMass = value
        UserDefaults.standard.set(value, forKey: key)
    }

    func load() {
        bodyMass = UserDefaults.standard.double(forKey: key)
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
