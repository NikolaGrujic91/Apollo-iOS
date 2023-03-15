//
//  ThemeManager.swift
//  ApolloTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import FoundationStorage
import SwiftUI
import UtilityExtensions

public final class ThemeManager: ObservableObject, StorageInjected {
    // MARK: - Properties

    @Published public var colorScheme: ColorScheme?
    private let key = "colorScheme"

    public init() {}

    // MARK: - Functions

    public func save(_ value: ColorScheme) {
        storage.set(value.toString(), forKey: key)
        colorScheme = value
    }

    public func load() {
        // if color scheme is stored in UserDefaults, use that value
        if let value: String = storage.get(forKey: key) {
            colorScheme = ColorScheme.fromString(value)
            return
        }

        getColorSchemeDevice()
    }

    private func getColorSchemeDevice() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            colorScheme = .dark
            return
        }

        colorScheme = .light
    }
}
