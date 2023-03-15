//
//  WeightRepositoryInjected.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 07/02/2023.
//

enum WeightRepositoryInjectionMap {
    static var weightRepository: WeightRepositoryProtocol = WeightRepository()
}

public protocol WeightRepositoryInjected: AnyObject {}

public extension WeightRepositoryInjected {
    var weightRepository: WeightRepositoryProtocol {
        WeightRepositoryInjectionMap.weightRepository
    }
}
