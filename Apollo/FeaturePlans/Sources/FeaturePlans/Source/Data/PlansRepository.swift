//
//  PlansRepository.swift
//  FoundationData
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import Foundation

final class PlansRepository: PlansRepositoryProtocol, PlansLoadingInjected {
    // MARK: - Properties

    var plans: [Plan] = []

    // MARK: - PlansRepositoryProtocol

    func load() async {
        if !plans.isEmpty {
            return
        }

        plans = plansLoader.load()
    }

    func save() {
        plansLoader.save(plans)
    }

    func reset() {
        plansLoader.remove()
        plans = plansLoader.load()
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
