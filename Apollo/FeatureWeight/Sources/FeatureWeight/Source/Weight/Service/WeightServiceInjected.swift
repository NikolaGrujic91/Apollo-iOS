//
//  WeightServiceInjected.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

@MainActor
enum WeightServiceInjectionMap {
    static var service: WeightServiceProtocol = WeightService()
}

protocol WeightServiceInjected: AnyObject {}

@MainActor
extension WeightServiceInjected {
    var service: WeightServiceProtocol {
        WeightServiceInjectionMap.service
    }
}
