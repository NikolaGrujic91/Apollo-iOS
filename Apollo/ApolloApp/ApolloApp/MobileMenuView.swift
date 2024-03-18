//
//  MobileMenuView.swift
//
//
//  Created by Nikola Grujic on 13/02/2023.
//

import FeaturePlans
import FoundationLocalization
import FoundationTheme
import SwiftUI

struct MobileMenuView: View {
    // MARK: - Properties

    @Environment(LocalizationViewModel.self)
    private var localization

    @State private var selectedTab: Int = 0

    private var tabsCount: Int = 3
    private let minDragTranslationForSwipe: CGFloat = 50

    // MARK: - Body

    var body: some View {
        TabView(selection: $selectedTab) {
            PlansView()
                .tabItem {
                    Label("plans".localized(localization.language), systemImage: "figure.run")
                }
                .tag(0)
                .highPriorityGesture(DragGesture().onEnded {
                    self.handleSwipe(translation: $0.translation.width)
                })
            SettingsView()
                .tabItem {
                    Label("settings".localized(localization.language), systemImage: "gearshape.fill")
                }
                .tag(1)
                .highPriorityGesture(DragGesture().onEnded {
                    self.handleSwipe(translation: $0.translation.width)
                })
        }
        .accessibilityElement(children: .contain)
        .accessibilityLabel(Text("Tab bar"))
    }

    // MARK: - Functions

    private func handleSwipe(translation: CGFloat) {
        let swipeLeft = translation > minDragTranslationForSwipe && selectedTab > 0

        if swipeLeft {
            selectedTab -= 1
            return
        }

        let swipeRight = translation < -minDragTranslationForSwipe && selectedTab < tabsCount - 1

        if swipeRight {
            selectedTab += 1
        }
    }
}

// MARK: - Preview

#Preview {
    MobileMenuView()
        .environment(ThemeViewModel())
        .environment(LocalizationViewModel())
}
