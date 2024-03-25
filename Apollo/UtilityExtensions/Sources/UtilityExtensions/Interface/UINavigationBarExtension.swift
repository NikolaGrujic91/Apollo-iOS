//
//  UINavigationBarExtension.swift
//  UtilityExtensions
//
//  Created by Nikola Grujic on 25/03/2024.
//

import UIKit

public extension UINavigationBar {
    static func applyCustomAppearance() {
        let appearance                      = UINavigationBarAppearance()
        appearance.backButtonAppearance     = backButtonAppearance()

        UINavigationBar.appearance().standardAppearance   = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }

    static func backButtonAppearance() -> UIBarButtonItemAppearance {
        // https://stackoverflow.com/questions/60527932/remove-back-button-text-from-navigationbar-in-swiftui
        let backButtonAppearance = UIBarButtonItemAppearance(style: .plain)
        backButtonAppearance.focused.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.disabled.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.clear]
        backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.clear]
        return backButtonAppearance
    }
}
