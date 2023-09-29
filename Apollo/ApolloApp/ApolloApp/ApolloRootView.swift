//
//  RootView.swift
//
//
//  Created by Nikola Grujic on 13/02/2023.
//

import FeaturePlans
import FeatureSettings
import SwiftUI

struct ApolloRootView: View {
    @State private var theme = ThemeViewModel()
    @StateObject private var localization = LocalizationViewModel()
    @StateObject private var plansViewModel = PlansViewModel()
    @StateObject private var activityViewModel = ActivityViewModel()
    @State private var weightViewModel = WeightViewModel()

    var body: some View {
        MobileMenuView()
            .environment(theme)
            .environmentObject(localization)
            .environmentObject(plansViewModel)
            .environmentObject(activityViewModel)
            .environment(weightViewModel)
            .onAppear {
                theme.load()
                localization.load()
            }
            .preferredColorScheme(theme.colorScheme)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        ApolloRootView()
            .environmentObject(LocalizationViewModel())
            .environment(ThemeViewModel())
            .environmentObject(PlansViewModel())
            .environmentObject(ActivityViewModel())
            .environment(WeightViewModel())
    }
}
