//
//  ThemeViewModel.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

@Observable
public final class ThemeViewModel: ThemeServiceInjected {
    // MARK: - Properties

    public var colorScheme: ColorScheme?

    // MARK: - Initializers

    public init() {}

    // MARK: - Functions

    public func save(_ value: ColorScheme) {
        service.save(value)
        colorScheme = value
    }

    public func load() {
        colorScheme = service.load()
    }
}
