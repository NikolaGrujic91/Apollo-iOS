//
//  PlansService.swift
//  FoundationData
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation

@MainActor
final class PlansService: PlansServiceProtocol, PlansRepositoryInjected {
    // MARK: - Properties

    var plans: [Plan] = []

    // MARK: - PlansServiceProtocol

    func load() async {
        if !plans.isEmpty {
            return
        }

        plans = repository.load()
    }

    func save() {
        repository.save(plans)
    }

    func reset() {
        repository.remove()
        plans = repository.load()
    }

    func get(_ id: UUID) -> Plan {
        guard let plan = plans.first(where: { $0.id == id }) else {
            return Plan()
        }

        return plan
    }

    func getDay(_ planId: UUID, _ weekId: UUID, _ dayId: UUID) -> Day {
        guard let plan = plans.first(where: { $0.id == planId }),
            let week = plan.weeks.first(where: { $0.id == weekId }),
            let day = week.days.first(where: { $0.id == dayId })
        else { return Day() }

        return day
    }
}
