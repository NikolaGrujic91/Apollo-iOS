//
//  PlansRepositoryInjected.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

@MainActor
enum PlansRepositoryInjectionMap {
    static var repository: PlansRepositoryProtocol = PlansRepository()
}

protocol PlansRepositoryInjected: AnyObject {}

@MainActor
extension PlansRepositoryInjected {
    public var repository: PlansRepositoryProtocol {
        PlansRepositoryInjectionMap.repository
    }
}
