//
//  WeightRepositoryInjected.swift
//  ApolloWeight
//
//  Created by Nikola Grujic on 07/02/2023.
//

enum WeightRepositoryInjectionMap {
    static var weightRepository: WeightRepositoryProtocol = WeightRepository()
}

public protocol WeightRepositoryInjected {}

extension WeightRepositoryInjected {
    public var weightRepository: WeightRepositoryProtocol {
        return WeightRepositoryInjectionMap.weightRepository
    }
}
