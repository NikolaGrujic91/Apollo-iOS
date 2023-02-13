//
//  PlansRepository.swift
//  ApolloData
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

class PlansRepository: PlansRepositoryProtocol, PlansLoadingInjected {
    // MARK: - Properties

    var plans: [Plan] = []

    // MARK: - PlansStoreProtocol

    func load() async {
        plans = plansLoader.load()
    }

    func save() -> Bool {
        return plansLoader.save(plans)
    }

    func reset() {
        plansLoader.remove()
        plans = plansLoader.load()
    }
}
