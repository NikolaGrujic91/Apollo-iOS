//
//  ThemeServiceInjected.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 07/06/2023.
//

enum ThemeServiceInjectionMap {
    static var service: ThemeServiceProtocol = ThemeService()
}

protocol ThemeServiceInjected: AnyObject {}

extension ThemeServiceInjected {
    var service: ThemeServiceProtocol {
        ThemeServiceInjectionMap.service
    }
}
