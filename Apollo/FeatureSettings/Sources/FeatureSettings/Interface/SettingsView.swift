//
//  SettingsView.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 14/02/2023.
//

import FoundationLocalization
import SwiftUI

public struct SettingsView: View {
    @Environment(ThemeViewModel.self)
    private var theme
    @Environment(LocalizationViewModel.self)
    private var localization
    @Environment(WeightViewModel.self)
    private var weightViewModel
    @State private var darkMode = false

    public init() {}

    public var body: some View {
        NavigationStack {
            List {
                Section(header: Text("appearance".localized(localization.language))) {
                    HStack(alignment: .center, spacing: 10) {
                        AppearanceToggle(
                            action: setLightMode,
                            systemName: darkMode ? "" : "checkmark.circle.fill",
                            rectangleColor: .white,
                            labelText: "light".localized(localization.language)
                        )
                        Spacer()
                        AppearanceToggle(
                            action: setDarkMode,
                            systemName: darkMode ? "checkmark.circle.fill" : "",
                            rectangleColor: .black,
                            labelText: "dark".localized(localization.language)
                        )
                    }
                }
                Section {
                    LanguagePicker()
                }
                Section(header: Text("weight".localized(localization.language))) {
                    NavigationLink(destination: WeightView()) {
                        HStack {
                            Text(weightViewModel.bodyMass)
                            Text("kg")
                        }
                    }
                }
                Section(header: Text("data".localized(localization.language))) {
                    ResetDataView()
                }
                Section(header: Text("information".localized(localization.language))) {
                    Text("version".localized(localization.language) + " 1.0.0")
                }
            }
            .onAppear {
                if let colorScheme = theme.colorScheme {
                    darkMode = colorScheme == .dark
                }

                weightViewModel.onAppear()
            }
            .navigationTitle("settings".localized(localization.language))
        }
    }

    func setLightMode() {
        theme.save(ColorScheme.light)
        darkMode = false
    }

    func setDarkMode() {
        theme.save(ColorScheme.dark)
        darkMode = true
    }
}

#Preview {
    SettingsView()
        .environment(ThemeViewModel())
        .environment(LocalizationViewModel())
        .environment(WeightViewModel())
}
