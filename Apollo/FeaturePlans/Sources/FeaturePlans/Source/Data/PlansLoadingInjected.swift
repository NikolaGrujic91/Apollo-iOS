//
//  PlansLoadingInjected.swift
//  FoundationData
//
//  Created by Nikola Grujic on 12/02/2023.
//

@MainActor
enum PlansLoaderInjectionMap {
    static var plansLoader: PlansLoadingProtocol = PlansFileLoader()
}

protocol PlansLoadingInjected: AnyObject {}

@MainActor
extension PlansLoadingInjected {
    public var plansLoader: PlansLoadingProtocol {
        PlansLoaderInjectionMap.plansLoader
    }
}
