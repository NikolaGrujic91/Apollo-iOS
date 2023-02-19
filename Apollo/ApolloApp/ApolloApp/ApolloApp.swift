//
//  ApolloApp.swift
//  ApolloApp
//
//  Created by Nikola Grujic on 19/02/2023.
//

import SwiftUI
import ApolloUI
import ApolloTheme
import ApolloLocalization

@main
struct ApolloApp: App {
    @StateObject var theme = ThemeManager()
    @StateObject var localization = LocalizationManager()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(theme)
                .environmentObject(localization)
                .onAppear {
                    theme.load()
                    localization.load()
                }
                .preferredColorScheme(theme.colorScheme)
        }
    }
}
