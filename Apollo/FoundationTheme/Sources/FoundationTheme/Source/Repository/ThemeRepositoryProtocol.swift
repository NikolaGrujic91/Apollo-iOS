//
//  ThemeRepositoryProtocol.swift
//  FoundationTheme
//
//  Created by Nikola Grujic on 20/08/2023.
//

import SwiftUI

protocol ThemeRepositoryProtocol: AnyObject {
    var colorScheme: ColorScheme? { get }

    ///
    /// Save chosen color scheme.
    ///
    func save(_ value: ColorScheme)

    ///
    /// Load color scheme.
    ///
    func load()
}
