//
//  PlansServiceInjected.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

@MainActor
enum PlansServiceInjectionMap {
    static var service: PlansServiceProtocol = PlansService()
}

protocol PlansServiceInjected {}

@MainActor
extension PlansServiceInjected {
    var service: PlansServiceProtocol {
        PlansServiceInjectionMap.service
    }
}
