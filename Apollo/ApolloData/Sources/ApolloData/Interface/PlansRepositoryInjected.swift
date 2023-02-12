//
//  PlansRepositoryInjected.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlansRepositoryInjectionMap {
    static var repository: PlansRepositoryProtocol = PlansRepository()
}

public protocol PlansRepositoryInjected {}

extension PlansRepositoryInjected {
    public var repository: PlansRepositoryProtocol {
        return PlansRepositoryInjectionMap.repository
    }
}
