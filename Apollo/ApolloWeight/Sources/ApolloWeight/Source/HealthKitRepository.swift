//
//  HealthKitRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import FoundationLogger
import Foundation
import HealthKit

final class HealthKitRepository {
    private let store = HKHealthStore()
    private(set) var bodyMass: Double = 0.0

    func requestAuthorization() async throws {
        if !HKHealthStore.isHealthDataAvailable() {
            throw HealthKitError(.healthData, ErrorLine())
        }

        guard let bodyMassType = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            throw HealthKitError(.quantityType, ErrorLine())
        }

        do {
            try await store.requestAuthorization(toShare: [], read: [bodyMassType])
        } catch {
            throw HealthKitError(.authorization(description: error.localizedDescription), ErrorLine())
        }
    }

    func fetchWeight() async throws {
        guard let sampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
            return
        }

        let oneYearAgo = Calendar.current.date(byAdding: .day, value: -365, to: Date())

        let predicate = HKQuery.predicateForSamples(withStart: oneYearAgo, end: .now, options: .strictEndDate)

        let queryDescriptor = HKSampleQueryDescriptor(
            predicates: [.quantitySample(type: sampleType, predicate: predicate)],
            sortDescriptors: []
        )

        do {
            let results = try await queryDescriptor.result(for: store)

            if let latestResult = results.last {
                bodyMass = latestResult.quantity.doubleValue(for: HKUnit.gramUnit(with: .kilo))
            }
        } catch {
            throw HealthKitError(.query(description: error.localizedDescription), ErrorLine())
        }
    }
}
