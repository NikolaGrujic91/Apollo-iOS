//
//  RootView.swift
//  
//
//  Created by Nikola Grujic on 13/02/2023.
//

import SwiftUI
import ApolloTheme
import ApolloLocalization

public struct ApolloRootView: View {
    @StateObject private var theme = ThemeManager()
    @StateObject private var localization = LocalizationManager()
    @StateObject private var timerViewModel = TimerViewModel()
    @StateObject private var weightViewModel = WeightViewModel()

    public init() {}

    public var body: some View {
        MobileMenuView()
            .environmentObject(theme)
            .environmentObject(localization)
            .environmentObject(timerViewModel)
            .environmentObject(weightViewModel)
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
            .environmentObject(LocalizationManager())
            .environmentObject(ThemeManager())
            .environmentObject(TimerViewModel())
            .environmentObject(WeightViewModel())
    }
}
