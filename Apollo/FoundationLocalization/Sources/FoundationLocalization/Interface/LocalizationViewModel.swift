//
//  LocalizationManager.swift
//  FoundationLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

import Observation
import FoundationStorage
import FoundationLogger

@Observable
public final class LocalizationViewModel: StorageInjected, LoggerInjected {
    // MARK: - Properties

    private let key = "language"
    public var language = LanguageCode.english

    public init() {}

    // MARK: - Functions

    public func save(_ value: LanguageCode) {
        if language == value {
            return
        }

        storage.set(value.rawValue, forKey: key)
        language = value
    }

    public func load() {
        if let value: String = storage.get(forKey: key) {
            language = LanguageCode(rawValue: value) ?? LanguageCode.english
        }

        logger.logInfo("Language: \(language.rawValue)")
    }
}
