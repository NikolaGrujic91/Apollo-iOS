//
//  PlansRepositoryInjected.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

@MainActor
enum PlansRepositoryInjectionMap {
    static var plansRepository: PlansRepositoryProtocol = PlansRepository()
}

protocol PlansRepositoryInjected {}

@MainActor
extension PlansRepositoryInjected {
    var plansRepository: PlansRepositoryProtocol {
        PlansRepositoryInjectionMap.plansRepository
    }
}
