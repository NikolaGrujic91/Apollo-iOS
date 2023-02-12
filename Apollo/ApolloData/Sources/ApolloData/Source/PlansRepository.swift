//
//  PlansRepository.swift
//  ApolloData
//
//  Created by Nikola Grujic on 05/07/2020.
//  Copyright © 2020 Nikola Grujic. All rights reserved.
//

import UIKit
import ApolloLogger

class PlansRepository: PlansRepositoryProtocol, PlansLoadingInjected, LoggerInjected {
    // MARK: - Properties

    var plans: [Plan] = []

    // MARK: - Initializers

    init() {
        plans = plansLoader.load()
    }

    // MARK: - PlansStoreProtocol

    func save() -> Bool {
        return plansLoader.save(plans)
    }

    func remove() {
        plansLoader.remove()
        plans = plansLoader.load()
    }
}
