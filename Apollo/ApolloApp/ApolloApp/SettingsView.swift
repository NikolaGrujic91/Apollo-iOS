//
//  SettingsView.swift
//  FeatureSettings
//
//  Created by Nikola Grujic on 14/02/2023.
//

import FeaturePlans
import FeatureWeight
import FoundationLocalization
import FoundationTheme
import SwiftUI

public struct SettingsView: View {
    // MARK: - Properties

    @Environment(LocalizationViewModel.self)
    private var localization
    @Environment(WeightViewModel.self)
    private var weightViewModel

    // MARK: - Initializers

    public init() {}

    // MARK: - Body

    public var body: some View {
        NavigationStack {
            List {
                Section(header: Text("appearance".localized(localization.language))) {
                    ThemePicker()
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
                    Text("version".localized(localization.language) + " \(Version.get())")
                }
            }
            .navigationTitle("settings".localized(localization.language))
        }
    }
}

// MARK: - Preview

#Preview {
    SettingsView()
        .environment(ThemeViewModel())
        .environment(LocalizationViewModel())
        .environment(WeightViewModel())
}
