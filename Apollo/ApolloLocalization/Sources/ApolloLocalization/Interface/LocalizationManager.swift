//
//  LocalizationManager.swift
//  ApolloLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

import Foundation
import FoundationStorage

public final class LocalizationManager: ObservableObject, StorageInjected {
    // MARK: - Properties

    private let key = "language"
    @Published public var language = Language.netherlands

    public init() {}

    // MARK: - Functions

    public func save(_ value: Language) {
        storage.set(value.rawValue, forKey: key)
        language = value
    }

    public func load() {
        if let value: String = storage.get(forKey: key) {
            language = Language(rawValue: value) ?? Language.netherlands
        }
    }
}
