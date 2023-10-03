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
        return Language.allCases.map { $0.rawValue }
    }

    func toCode() -> LanguageCode {
        switch self {
        case .german:
            return LanguageCode.german
        case .english:
            return LanguageCode.english
        case .spanish:
            return LanguageCode.spanish
        case .french:
            return LanguageCode.french
        case .japanese:
            return LanguageCode.japanese
        case .netherlands:
            return LanguageCode.netherlands
        case .portuguese:
            return LanguageCode.portuguese
        }
    }
}
