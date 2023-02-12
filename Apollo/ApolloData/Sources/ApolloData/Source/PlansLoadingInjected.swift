//
//  PlansLoadingInjected.swift
//  ApolloData
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlansLoaderInjectionMap {
    static var plansLoader: PlansLoadingProtocol = PlansFileLoader()
}

protocol PlansLoadingInjected {}

extension PlansLoadingInjected {
    public var plansLoader: PlansLoadingProtocol {
        return PlansLoaderInjectionMap.plansLoader
    }
}
