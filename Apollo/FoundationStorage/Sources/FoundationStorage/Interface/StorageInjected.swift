//
//  StorageInjected.swift
//  FoundationStorage
//
//  Created by Nikola Grujic on 14/03/2023.
//

enum StorageInjectionMap {
    static var storage: StorageProtocol = StorageUserDefaults()
}

public protocol StorageInjected {}

public extension StorageInjected {
    var storage: StorageProtocol {
        StorageInjectionMap.storage
    }
}
