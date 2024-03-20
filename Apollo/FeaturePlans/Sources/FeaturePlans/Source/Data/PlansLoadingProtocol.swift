//
//  PlansLoadingProtocol.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

@MainActor
protocol PlansLoadingProtocol: AnyObject {
    ///
    /// Save plans with updated calories and distances in UserDefaults.
    ///
    /// - Returns true if success, false otherwise
    ///
    func save(_ plans: [Plan])

    ///
    /// Load plans from UserDefaults. Otherwise load default plans from Resources.
    ///
    /// - Returns returns array of plans
    ///
    func load() -> [Plan]

    ///
    /// Remove plans from UserDefaults.
    ///
    func remove()
}
