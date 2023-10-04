//
//  PlansRepositoryInjected.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlansRepositoryInjectionMap {
    static var plansRepository: PlansRepositoryProtocol = PlansRepository()
}

public protocol PlansRepositoryInjected {}

public extension PlansRepositoryInjected {
    var plansRepository: PlansRepositoryProtocol {
        PlansRepositoryInjectionMap.plansRepository
    }
}
