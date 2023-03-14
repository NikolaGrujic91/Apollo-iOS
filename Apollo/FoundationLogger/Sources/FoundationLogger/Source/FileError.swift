//
//  FileError.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public final class FileError: Error {
    public enum FileErrorType {
        case fileNotFound(fileName: String)
        case readingFileString
        case emptyString
        case readingJsonData
        case decodingJsonData(description: String)
        case encodingJsonData(description: String)
    }

    let errorType: FileErrorType

    public init(_ errorType: FileErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }

    // MARK: - ErrorProtocol

    public var errorLine: ErrorLine
}

extension FileError: ErrorProtocol {
    public var errorDescription: String? {
        switch errorType {
        case let .fileNotFound(fileName):
            return "File \(fileName) not found. "
        case .readingFileString:
            return "Not possible to read string from file."
        case .emptyString:
            return "Empty string."
        case .readingJsonData:
            return "Not possible to read json data from string."
        case .decodingJsonData:
            return "Not possible to decode json data."
        case .encodingJsonData:
            return "Not possible to encode json data."
        }
    }

    public var failureReason: String? {
        switch errorType {
        case let .fileNotFound(fileName):
            return "File \(fileName) not found in the resources folder."
        case .readingFileString:
            return "File seems to be empty or corrupted."
        case .emptyString:
            return "File seems to be empty."
        case .readingJsonData:
            return "String seems to be empty or corrupted."
        case let .decodingJsonData(description):
            return "\(description)"
        case let .encodingJsonData(description):
            return "\(description)"
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case let .fileNotFound(fileName):
            return "Check if the file \(fileName) exists."
        case .readingFileString:
            return "Check if file is not empty."
        case .emptyString:
            return "Check if file is not empty."
        case .readingJsonData:
            return "Check if the content of the file is valid."
        case .decodingJsonData:
            return "Check if the content of the file is valid json."
        case .encodingJsonData:
            return "Check if the content of the file is valid json."
        }
    }
}
