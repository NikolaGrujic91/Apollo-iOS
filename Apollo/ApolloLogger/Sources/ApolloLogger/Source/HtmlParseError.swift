//
//  HtmlParseError.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public class HtmlParseError: Error {
    public enum HtmlParseErrorType {
        case emptyHtml
        case parseName
        case parseSize
        case parsePrices
        case parsePricePerUnit
        case parseAction
        case parseImage
    }

    let errorType: HtmlParseErrorType

    public init(_ errorType: HtmlParseErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }
    // MARK: - ErrorProtocol
    public var errorLine: ErrorLine
}

extension HtmlParseError: ErrorProtocol {
    public var errorDescription: String? {
        switch self.errorType {
        case .emptyHtml:
            return "Empty html."
        case .parseName:
            return "Not possible to parse name."
        case .parseSize:
            return "Not possible to parse size."
        case .parsePrices:
            return "Not possible to parse prices."
        case .parsePricePerUnit:
            return "Not possible to parse price per unit."
        case .parseAction:
            return "Not possible to parse action."
        case .parseImage:
            return "Not possible to parse image."
        }
    }

    public var failureReason: String? {
        switch self.errorType {
        case .emptyHtml:
            return "Input html is empty."
        case .parseName:
            return "Name element not found in html."
        case .parseSize:
            return "Size element not found in html."
        case .parsePrices:
            return "Prices element not found in html."
        case .parsePricePerUnit:
            return "Prices per unit element not found in html."
        case .parseAction:
            return "Name element not found in html."
        case .parseImage:
            return "Name element not found in html."
        }
    }

    public var recoverySuggestion: String? {
        switch self.errorType {
        case .emptyHtml:
            return "Check if http response returns html"
        case .parseName:
            return "Check if html contains element"
        case .parseSize:
            return "Check if html contains element"
        case .parsePrices:
            return "Check if html contains element"
        case .parsePricePerUnit:
            return "Check if html contains element"
        case .parseAction:
            return "Check if html contains element"
        case .parseImage:
            return "Check if html contains element"
        }
    }
}
