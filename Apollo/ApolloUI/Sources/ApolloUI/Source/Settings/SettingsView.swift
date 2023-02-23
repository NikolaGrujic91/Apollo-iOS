//
//  SettingsView.swift
//  ApolloUI
//
//  Created by Nikola Grujic on 14/02/2023.
//

import ApolloLocalization
import ApolloTheme
import ApolloWeight
import SwiftUI

struct SettingsView: View {
    @EnvironmentObject private var theme: ThemeManager
    @EnvironmentObject private var localization: LocalizationManager
    @EnvironmentObject private var weightViewModel: WeightViewModel
    @State private var darkMode = false
    @State private var selectedLanguage = Language.netherlands

    var body: some View {
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
                Section(header: Text("language".localized(localization.language))) {
                    Picker("Selected language", selection: $selectedLanguage) {
                        ForEach(Language.allCases) { language in
                            Text(language.rawValue)
                        }
                    }
                    .labelsHidden()
                    .pickerStyle(.inline)
                    .onChange(of: selectedLanguage) { language in
                        localization.save(language)
                    }
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

                selectedLanguage = localization.language
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(ThemeManager())
            .environmentObject(LocalizationManager())
            .environmentObject(WeightViewModel())
    }
}
