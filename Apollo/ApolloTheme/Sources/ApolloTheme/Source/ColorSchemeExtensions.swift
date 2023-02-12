//
//  ColorSchemeExtensions.swift
//  ApolloTheme
//
//  Created by Nikola Grujic on 12/02/2023.
//

import SwiftUI

extension ColorScheme {
    func toString() -> String {
        if self == .dark {
            return "dark"
        }

        return "light"
    }

    static func fromString(_ value: String) -> ColorScheme {
        if value == "dark" {
            return .dark
        }

        return .light
    }
}
