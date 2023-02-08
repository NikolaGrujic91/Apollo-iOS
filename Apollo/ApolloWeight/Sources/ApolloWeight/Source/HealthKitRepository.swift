//
//  HealthKitRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation
import HealthKit

class HealthKitRepository {
    private let store = HKHealthStore()
    private(set) var bodyMass: Double = 0.0

    func requestAuthorization() async {
        if !HKHealthStore.isHealthDataAvailable() {
            print("Health data not available")
            return
        }

        guard let quantityType = HKQuantityType.quantityType(forIdentifier: .bodyMass) else {
            print("Quantity type not recognized")
            return
        }

        let workoutType = HKObjectType.workoutType()

        do {
            try await store.requestAuthorization(toShare: [], read: [quantityType, workoutType])
            print("Authorization success")
        } catch {
            print(error)
        }
    }

    public func fetchWeight() async {
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
            print(error)
        }
    }
}
