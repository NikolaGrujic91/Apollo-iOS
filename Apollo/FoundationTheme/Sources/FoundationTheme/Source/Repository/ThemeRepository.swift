//
//  ThemeRepository.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import FoundationLogger
import FoundationStorage
import SwiftUI
import UtilityExtensions

@MainActor
final class ThemeRepository: ThemeRepositoryProtocol, LoggerInjected, StorageInjected {
    // MARK: - Properties

    private(set) var colorScheme: ColorScheme?
    private let key = "colorScheme"

    // MARK: - ThemeRepositoryProtocol

    func save(_ value: ColorScheme) {
        storage.set(value.toString(), forKey: key)
        colorScheme = value
        logger.logInfo("Color scheme: \(colorScheme?.toString() ?? "not loaded")")
    }

    func load() {
        // if color scheme is stored in UserDefaults, use that value
        if let value: String = storage.get(forKey: key) {
            colorScheme = ColorScheme.fromString(value)
            logger.logInfo("Color scheme: \(colorScheme?.toString() ?? "not loaded")")
            return
        }

        getColorSchemeDevice()
        logger.logInfo("Color scheme: \(colorScheme?.toString() ?? "not loaded")")
    }

    private func getColorSchemeDevice() {
        colorScheme = UITraitCollection.current.userInterfaceStyle.toColorScheme()
    }
}
