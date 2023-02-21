//
//  LocalizationManager.swift
//  ApolloLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

import Foundation

public final class LocalizationManager: ObservableObject {
    // MARK: - Properties
    private let key = "language"
    @Published public var language = Language.netherlands

    public init() {}

    // MARK: - Functions
    public func save(_ value: Language) {
        let defaults = UserDefaults.standard
        defaults.set(value.rawValue, forKey: key)

        self.language = value
    }

    public func load() {
        let defaults = UserDefaults.standard

        if let stringValue = defaults.object(forKey: key) as? String {
            self.language = Language(rawValue: stringValue) ?? Language.netherlands
        }
    }
}
