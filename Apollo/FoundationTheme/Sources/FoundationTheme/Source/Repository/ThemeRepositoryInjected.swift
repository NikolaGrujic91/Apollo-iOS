//
//  ThemeRepositoryInjected.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 07/06/2023.
//

@MainActor
enum ThemeRepositoryInjectionMap {
    static var repository: ThemeRepositoryProtocol = ThemeRepository()
}

protocol ThemeRepositoryInjected: AnyObject {}

@MainActor
extension ThemeRepositoryInjected {
    var repository: ThemeRepositoryProtocol {
        ThemeRepositoryInjectionMap.repository
    }
}
