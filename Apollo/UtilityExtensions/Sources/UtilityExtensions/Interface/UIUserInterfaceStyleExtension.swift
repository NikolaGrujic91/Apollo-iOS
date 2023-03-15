//
//  UIUserInterfaceStyleExtension.swift
//  
//
//  Created by Nikola Grujic on 15/03/2023.
//

import UIKit
import SwiftUI

public extension UIUserInterfaceStyle {
    func toColorScheme() -> ColorScheme {
        self == .dark ? ColorScheme.dark : ColorScheme.light
    }
}
