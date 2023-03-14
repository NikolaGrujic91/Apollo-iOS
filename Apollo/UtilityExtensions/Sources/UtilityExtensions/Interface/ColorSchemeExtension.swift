//
//  ColorSchemeExtension.swift
//  UtilityExtensions
//
//  Created by Nikola Grujic on 14/03/2023.
//

import SwiftUI

public extension ColorScheme {
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
