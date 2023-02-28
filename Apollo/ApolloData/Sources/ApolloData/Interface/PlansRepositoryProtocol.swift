//
//  PlansRepositoryProtocol.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

import Foundation

public protocol PlansRepositoryProtocol: AnyObject {
    var plans: [Plan] { get }

    ///
    /// Load plans from UserDefaults, Otherwise load default plans from Resources.
    ///
    func load() async

    ///
    /// Save plans with updated calories and distances in UserDefaults.
    ///
    func save()

    ///
    /// Remove plans from UserDefaults and load default plans from Resources.
    ///
    func reset()

    ///
    /// Get Plan for given UUID.
    ///
    /// - Returns: Plan with guid if it exists, otherwise empty Plan.
    ///
    func get(_ id: UUID) -> Plan
}
