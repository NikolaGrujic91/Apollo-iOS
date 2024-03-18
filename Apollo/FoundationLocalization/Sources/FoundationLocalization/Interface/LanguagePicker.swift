//
//  LanguagePicker.swift
//  SharedUI
//
//  Created by Nikola Grujic on 30/08/2023.
//

import SharedUI
import SwiftUI

public struct LanguagePicker: View {
    // MARK: - Properties

    @Environment(LocalizationViewModel.self)
    private var localizationViewModel

    // MARK: - Initializers

    public init() {}

    // MARK: - Body

    public var body: some View {
        ApolloPicker(
            "language".localized(localizationViewModel.language),
            localizationViewModel.language.toLanguage().rawValue,
            Language.toArray()
        ) { value in
            localizationViewModel.save(Language(rawValue: value)?.toCode() ?? Language.english.toCode())
        }
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        LanguagePicker()
            .padding()
            .environment(LocalizationViewModel())
    }
}
