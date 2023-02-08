//
//  HealthKitRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation
import HealthKit
import ApolloLogger

class HealthKitRepository {
    private let store = HKHealthStore()
    private(set) var bodyMass: Double = 0.0
    private var authorized = false

    func requestAuthorization() async throws {
        if !HKHealthStore.isHealthDataAvailable() {
            throw HealthKitError(.healthData, ErrorLine())
        }

        guard let quantityType = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            throw HealthKitError(.quantityType, ErrorLine())
        }

        let workoutType = HKObjectType.workoutType()

        do {
            try await store.requestAuthorization(toShare: [], read: [quantityType, workoutType])
            let status = store.authorizationStatus(for: workoutType)
            authorized = status == .sharingAuthorized
        } catch {
            authorized = false
            throw HealthKitError(.authorization(description: error.localizedDescription), ErrorLine())
        }
    }

    func fetchWeight() async throws {
        if !authorized {
            return
        }

        guard let sampleType = HKSampleType.quantityType(forIdentifier: .bodyMass) else {
            return
        }

        let calendar = Calendar.current
        var components: DateComponents = calendar.dateComponents([.year, .month, .day], from: Date())
        components.day = components.day ?? 7 - 7
        let oneWeekAgo = calendar.date(from: components)

        let predicate = HKQuery.predicateForSamples(withStart: oneWeekAgo, end: .now, options: .strictEndDate)

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
