//
//  PlansRepositoryInjected.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlansRepositoryInjectionMap {
    static var plansRepository: PlansRepositoryProtocol = PlansRepository()
}

public protocol PlansRepositoryInjected {}

extension PlansRepositoryInjected {
    public var plansRepository: PlansRepositoryProtocol {
        return PlansRepositoryInjectionMap.plansRepository
    }
}
