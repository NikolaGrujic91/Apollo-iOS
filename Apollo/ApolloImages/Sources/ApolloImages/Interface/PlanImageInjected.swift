//
//  PlanImageInjected.swift
//  ApolloImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum PlanImageInjectionMap {
    static var planImage: PlanImageProtocol = PlanImageManager()
}

public protocol PlanImageInjected {}

extension PlanImageInjected {
    public var planImage: PlanImageProtocol {
        return PlanImageInjectionMap.planImage
    }
}
