//
//  ThemeServiceProtocol.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 20/08/2023.
//

import SwiftUI

protocol ThemeServiceProtocol: AnyObject {
    ///
    /// Save chosen color scheme.
    ///
    func save(_ value: ColorScheme)

    ///
    /// Load color scheme.
    ///
    func load() -> ColorScheme?
}
