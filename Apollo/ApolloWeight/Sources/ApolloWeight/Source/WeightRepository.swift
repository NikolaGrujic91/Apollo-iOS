//
//  WeightRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation
import ApolloLogger

class WeightRepository: WeightRepositoryProtocol, LoggerInjected {
    // MARK: - Properties
    var value: Double = 0.0
    private let key: String = "ApolloWeight"
    private let healthKitRepository = HealthKitRepository()

    // MARK: - Initializers
    init() {
        self.load()
    }

    // MARK: - WeightRepositoryProtocol

    func save(_ value: Double) {
        self.value = value
        UserDefaults.standard.set(value, forKey: key)
    }

    func load() {
        value = UserDefaults.standard.double(forKey: key)
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
