//
//  Language.swift
//  FoundationLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

public enum LanguageCode: String, CaseIterable, Identifiable {
    case german      = "de"
    case english     = "en"
    case spanish     = "es"
    case french      = "fr"
    case japanese    = "ja"
    case netherlands = "nl"
    case portuguese  = "pt"

    public var id: Self { self }
}

public extension LanguageCode {
    static func toArray() -> [String] {
        return LanguageCode.allCases.map { $0.rawValue }
    }

    func toLanguage() -> Language {
        switch self {
        case .german:
            return Language.german
        case .english:
            return Language.english
        case .spanish:
            return Language.spanish
        case .french:
            return Language.french
        case .japanese:
            return Language.japanese
        case .netherlands:
            return Language.netherlands
        case .portuguese:
            return Language.portuguese
        }
    }
}
