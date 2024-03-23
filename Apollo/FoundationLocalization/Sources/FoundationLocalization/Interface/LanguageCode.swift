//
//  LanguageCode.swift
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
    case portuguese  = "pt-PT"

    public var id: Self { self }
}

public extension LanguageCode {
    static func toArray() -> [String] {
        LanguageCode.allCases.map { $0.rawValue }
    }

    func toLanguage() -> Language {
        switch self {
        case .german:
            Language.german
        case .english:
            Language.english
        case .spanish:
            Language.spanish
        case .french:
            Language.french
        case .japanese:
            Language.japanese
        case .netherlands:
            Language.netherlands
        case .portuguese:
            Language.portuguese
        }
    }
}
