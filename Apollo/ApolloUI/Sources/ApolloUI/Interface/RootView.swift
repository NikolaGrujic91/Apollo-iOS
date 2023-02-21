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
    @StateObject var theme = ThemeManager()
    @StateObject var localization = LocalizationManager()

    public init() {}

    public var body: some View {
        MobileMenuView()
            .environmentObject(theme)
            .environmentObject(localization)
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
            .environmentObject(ThemeManager())
            .environmentObject(LocalizationManager())
    }
}
