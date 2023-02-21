//
//  ThemeManager.swift
//  ApolloTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

public final class ThemeManager: ObservableObject {
    // MARK: - Properties
    @Published public var colorScheme: ColorScheme?
    private let key = "colorScheme"

    public init() {}

    // MARK: - Functions
    public func save(_ value: ColorScheme) {
        let defaults = UserDefaults.standard
        defaults.set(value.toString(), forKey: key)

        self.colorScheme = value
    }

    public func load() {
        let defaults = UserDefaults.standard

        // if color scheme is stored in UserDefaults, use that value
        if let stringValue = defaults.object(forKey: key) as? String {
            self.colorScheme = ColorScheme.fromString(stringValue)
            return
        }

        getColorSchemeDevice()
    }

    private func getColorSchemeDevice() {
        if UITraitCollection.current.userInterfaceStyle == .dark {
            self.colorScheme = .dark
            return
        }

        self.colorScheme = .light
    }
}
