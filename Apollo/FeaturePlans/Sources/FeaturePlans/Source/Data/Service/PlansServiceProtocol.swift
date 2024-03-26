//
//  PlansServiceProtocol.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

import Foundation

@MainActor
protocol PlansServiceProtocol: AnyObject {
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

    ///
    /// Get Day for given UUIDs.
    ///
    /// - Returns: Day with guid if it exists, otherwise empty Day.
    ///
    func getDay(_ planId: UUID, _ weekId: UUID, _ dayId: UUID) -> Day
}
