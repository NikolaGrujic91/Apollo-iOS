//
//  ThemeService.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

final class ThemeService: ThemeServiceProtocol, ThemeRepositoryInjected {
    // MARK: - Properties

    public init() {}

    // MARK: - ThemeServiceProtocol

    func save(_ value: ColorScheme) {
        repository.save(value)
    }

    func load() -> ColorScheme? {
        repository.load()
        return repository.colorScheme
    }
}
