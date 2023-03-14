//
//  StringExtensions.swift
//  ApolloLocalization
//
//  Created by Nikola Grujic on 14/02/2023.
//

import FoundationLogger
import Foundation

extension String: LoggerInjected {
    public func localized(_ language: Language) -> String {
        guard let path = Bundle.module.path(forResource: language.rawValue, ofType: "lproj")
        else {
            logger.handleError(LocalizationError(.pathNotFound, ErrorLine()))
            return ""
        }

        guard let bundle = Bundle(path: path)
        else {
            logger.handleError(LocalizationError(.bundleNotFound, ErrorLine()))
            return ""
        }

        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
    }
}
