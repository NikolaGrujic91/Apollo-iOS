//
//  ApolloApp.swift
//  ApolloApp
//
//  Created by Nikola Grujic on 19/02/2023.
//

import SwiftUI
import UtilityExtensions

@main
struct ApolloApp: App {
    // MARK: - Initializers

    init() {
        UINavigationBar.applyCustomAppearance()
    }

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            ApolloRootView()
                .tint(Color(UIColor.systemOrange))
        }
    }
}
