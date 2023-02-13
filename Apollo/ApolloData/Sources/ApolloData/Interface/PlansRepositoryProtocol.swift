//
//  PlansRepositoryProtocol.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

public protocol PlansRepositoryProtocol {
    var plans: [Plan] { get }

    ///
    /// Load plans from UserDefaults, Otherwise load default plans from Resources.
    ///
    func load() async

    ///
    /// Save plans with updated calories and distances in UserDefaults.
    ///
    /// - Returns true if success, false otherwise
    ///
    func save() -> Bool

    ///
    /// Remove plans from UserDefaults and load default plans from Resources.
    ///
    func reset()
}
