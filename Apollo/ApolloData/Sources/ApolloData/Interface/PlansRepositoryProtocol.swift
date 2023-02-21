//
//  PlansRepositoryProtocol.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

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
}
