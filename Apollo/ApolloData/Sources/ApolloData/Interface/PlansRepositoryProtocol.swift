//
//  PlansRepositoryProtocol.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

public protocol PlansRepositoryProtocol {
    var plans: [Plan] { get }

    ///
    /// Save plans with updated calories and distances in UserDefaults.
    ///
    /// - Returns true if success, false otherwise
    ///
    func save() -> Bool

    ///
    /// Remove plans from UserDefaults.
    ///
    func remove()
}
