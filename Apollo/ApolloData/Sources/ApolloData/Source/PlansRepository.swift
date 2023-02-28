//
//  PlansRepository.swift
//  ApolloData
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
}
