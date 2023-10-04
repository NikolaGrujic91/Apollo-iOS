//
//  RootView.swift
//
//
//  Created by Nikola Grujic on 13/02/2023.
//

import FeaturePlans
import FeatureWeight
import FoundationTheme
import FoundationLocalization
import SwiftUI

struct ApolloRootView: View {
    @State private var theme = ThemeViewModel()
    @State private var localization = LocalizationViewModel()
    @State private var plansViewModel = PlansViewModel()
    @State private var activityViewModel = ActivityViewModel()
    @State private var weightViewModel = WeightViewModel()

    var body: some View {
        MobileMenuView()
            .environment(theme)
            .environment(localization)
            .environment(plansViewModel)
            .environment(activityViewModel)
            .environment(weightViewModel)
            .onAppear {
                theme.load()
                localization.load()
            }
            .preferredColorScheme(theme.colorScheme)
    }
}

#Preview {
    ApolloRootView()
        .environment(LocalizationViewModel())
        .environment(ThemeViewModel())
        .environment(PlansViewModel())
        .environment(ActivityViewModel())
        .environment(WeightViewModel())
}
