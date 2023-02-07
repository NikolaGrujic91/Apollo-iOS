//
//  FetchError.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public class FetchError: Error {
    public enum FetchErrorType {
        case noLinks
        case emptyLink
        case badUrl
        case responseError(description: String)
        case responseBodyError
    }

    let errorType: FetchErrorType

    public init(_ errorType: FetchErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }
    // MARK: - ErrorProtocol
    public var errorLine: ErrorLine
}

extension FetchError: ErrorProtocol {
    public var errorDescription: String? {
        switch self.errorType {
        case .noLinks:
            return "Empty links array."
        case .emptyLink:
            return "Empty link."
        case .badUrl:
            return "Error creating URL."
        case .responseError(let description):
            return "\(description)"
        case .responseBodyError:
            return "Error reading response body."
        }
    }

    public var failureReason: String? {
        switch self.errorType {
        case .noLinks:
            return "Can not fetch from empty links."
        case .emptyLink:
            return "Can not fetch from empty link."
        case .badUrl:
            return "Bad url created."
        case .responseError:
            return "Response with error."
        case .responseBodyError:
            return "Empty or corrupted response body."
        }
    }

    public var recoverySuggestion: String? {
        switch self.errorType {
        case .noLinks:
            return "Check if links are missing in the products.json."
        case .emptyLink:
            return "Check if link is missing in the products.json."
        case .badUrl:
            return "Check the base url and link."
        case .responseError:
            return "Check response."
        case .responseBodyError:
            return "Check response body."
        }
    }
}
