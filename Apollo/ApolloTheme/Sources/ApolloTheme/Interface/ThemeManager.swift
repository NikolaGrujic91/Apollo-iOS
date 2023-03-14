//
//  ThemeManager.swift
//  ApolloTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI
import UtilityExtensions

public final class ThemeManager: ObservableObject {
    // MARK: - Properties

    @Published public var colorScheme: ColorScheme?
    private let key = "colorScheme"

    public init() {}

    // MARK: - Functions

    public func save(_ value: ColorScheme) {
        let defaults = UserDefaults.standard
        defaults.set(value.toString(), forKey: key)

        colorScheme = value
    }

    public func load() {
        let defaults = UserDefaults.standard

        // if color scheme is stored in UserDefaults, use that value
        if let stringValue = defaults.object(forKey: key) as? String {
            colorScheme = ColorScheme.fromString(stringValue)
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
