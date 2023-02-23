//
//  PlanImageInjected.swift
//  ApolloImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlanImageInjectionMap {
    static var planImage: PlanImageProtocol = PlanImageManager()
}

public protocol PlanImageInjected: AnyObject {}

public extension PlanImageInjected {
    var planImage: PlanImageProtocol {
        PlanImageInjectionMap.planImage
    }
}
