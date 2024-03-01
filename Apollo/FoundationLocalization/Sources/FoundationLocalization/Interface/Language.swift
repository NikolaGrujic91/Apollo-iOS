//
//  Language.swift
//  FoundationLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

public enum Language: String, CaseIterable, Identifiable {
    case german      = "Deutsch"
    case english     = "English"
    case spanish     = "Español"
    case french      = "Français"
    case japanese    = "日本語"
    case netherlands = "Nederlands"
    case portuguese  = "Português"

    public var id: Self { self }
}

public extension Language {
    static func toArray() -> [String] {
        Language.allCases.map { $0.rawValue }
    }

    func toCode() -> LanguageCode {
        switch self {
        case .german:
            LanguageCode.german
        case .english:
            LanguageCode.english
        case .spanish:
            LanguageCode.spanish
        case .french:
            LanguageCode.french
        case .japanese:
            LanguageCode.japanese
        case .netherlands:
            LanguageCode.netherlands
        case .portuguese:
            LanguageCode.portuguese
        }
    }
}
