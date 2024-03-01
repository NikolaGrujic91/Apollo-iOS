//
//  ImagesInjected.swift
//  FoundationImages
//
//  Created by Nikola Grujic on 12/02/2023.
//

enum ImagesInjectionMap {
    static var images: ImagesProtocol = ImagesManager()
}

public protocol ImagesInjected: AnyObject {}

public extension ImagesInjected {
    var images: ImagesProtocol {
        ImagesInjectionMap.images
    }
}
