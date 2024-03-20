//
//  WeightRepositoryInjected.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

@MainActor
enum WeightRepositoryInjectionMap {
    static var repository: WeightRepositoryProtocol = WeightRepository()
}

protocol WeightRepositoryInjected: AnyObject {}

@MainActor
extension WeightRepositoryInjected {
    var repository: WeightRepositoryProtocol {
        WeightRepositoryInjectionMap.repository
    }
}
