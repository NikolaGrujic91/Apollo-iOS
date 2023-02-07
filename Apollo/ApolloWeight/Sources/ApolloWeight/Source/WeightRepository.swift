//
//  WeightRepository.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation

class WeightRepository: WeightRepositoryProtocol {
    // MARK: - Properties
    var value: Double = 0.0
    private let key: String = "ApolloWeight"

    // MARK: - Initializers
    init() {
        self.load()
    }

    // MARK: - WeightRepositoryProtocol

    func save(_ value: Double) {
        self.value = value
        UserDefaults.standard.set(value, forKey: key)
    }

    func load() {
        value = UserDefaults.standard.double(forKey: key)
    }
}
