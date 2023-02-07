//
//  WeightRepositoryInjected.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

enum WeightRepositoryInjectionMap {
    static var repository: WeightRepositoryProtocol = WeightRepository()
}

public protocol WeightRepositoryInjected {}

extension WeightRepositoryInjected {
    var repository: WeightRepositoryProtocol {
        return WeightRepositoryInjectionMap.repository
    }
}
