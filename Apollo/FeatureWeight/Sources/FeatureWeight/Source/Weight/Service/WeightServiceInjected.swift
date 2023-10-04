//
//  WeightServiceInjected.swift
//  FeatureWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

enum WeightServiceInjectionMap {
    static var service: WeightServiceProtocol = WeightService()
}

protocol WeightServiceInjected: AnyObject {}

extension WeightServiceInjected {
    var service: WeightServiceProtocol {
        WeightServiceInjectionMap.service
    }
}
