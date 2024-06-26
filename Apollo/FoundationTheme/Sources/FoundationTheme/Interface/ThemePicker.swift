//
//  ThemePicker.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 20/08/2023.
//

import FoundationLocalization
import SwiftUI

public struct ThemePicker: View {
    // MARK: - Properties

    @Environment(ThemeViewModel.self)
    private var viewModel
    @Environment(LocalizationViewModel.self)
    private var localizationViewModel

    @State private var darkMode = false

    // MARK: - Initializers

    public init() {}

    // MARK: - Body

    public var body: some View {
        HStack(alignment: .center, spacing: 10) {
            AppearanceToggle(
                systemName: darkMode ? "" : "checkmark.circle",
                rectangleColor: .white,
                labelText: "light".localized(localizationViewModel.language)
            ) {
                viewModel.save(ColorScheme.light)
                darkMode = false
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
            AppearanceToggle(
                systemName: darkMode ? "checkmark.circle" : "",
                rectangleColor: .black,
                labelText: "dark".localized(localizationViewModel.language)
            ) {
                viewModel.save(ColorScheme.dark)
                darkMode = true
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding(.horizontal)
        }
        .onAppear {
            if let colorScheme = viewModel.colorScheme {
                darkMode = colorScheme == .dark
            }
        }
    }
}

// MARK: - Preview

#Preview {
    ThemePicker()
        .environment(ThemeViewModel())
        .environment(LocalizationViewModel())
}
