//
//  UIUserInterfaceStyleExtension.swift
//
//
//  Created by Nikola Grujic on 15/03/2023.
//

import SwiftUI
import UIKit

public extension UIUserInterfaceStyle {
    func toColorScheme() -> ColorScheme {
        self == .dark ? ColorScheme.dark : ColorScheme.light
    }
}
