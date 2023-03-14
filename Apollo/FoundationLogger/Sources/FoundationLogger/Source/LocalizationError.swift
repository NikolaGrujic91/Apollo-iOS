//
//  LocalizationError.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public final class LocalizationError: Error {
    public enum LocalizationErrorType {
        case pathNotFound
        case bundleNotFound
    }

    let errorType: LocalizationErrorType

    public init(_ errorType: LocalizationErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }

    // MARK: - ErrorProtocol

    public var errorLine: ErrorLine
}

extension LocalizationError: ErrorProtocol {
    public var errorDescription: String? {
        switch errorType {
        case .pathNotFound:
            return "Path to resource .lproj not found."
        case .bundleNotFound:
            return "Bundle not found"
        }
    }

    public var failureReason: String? {
        switch errorType {
        case .pathNotFound:
            return ".lproj file missing."
        case .bundleNotFound:
            return "Bundle missing."
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case .pathNotFound:
            return "Check if .lproj is in resources folder."
        case .bundleNotFound:
            return "Check if bundle exists."
        }
    }
}
