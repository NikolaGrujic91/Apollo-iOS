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
            "File \(fileName) not found. "
        case .readingFileString:
            "Not possible to read string from file."
        case .emptyString:
            "Empty string."
        case .readingJsonData:
            "Not possible to read json data from string."
        case .decodingJsonData:
            "Not possible to decode json data."
        case .encodingJsonData:
            "Not possible to encode json data."
        }
    }

    public var failureReason: String? {
        switch errorType {
        case let .fileNotFound(fileName):
            "File \(fileName) not found in the resources folder."
        case .readingFileString:
            "File seems to be empty or corrupted."
        case .emptyString:
            "File seems to be empty."
        case .readingJsonData:
            "String seems to be empty or corrupted."
        case let .decodingJsonData(description):
            "\(description)"
        case let .encodingJsonData(description):
            "\(description)"
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case let .fileNotFound(fileName):
            "Check if the file \(fileName) exists."
        case .readingFileString:
            "Check if file is not empty."
        case .emptyString:
            "Check if file is not empty."
        case .readingJsonData:
            "Check if the content of the file is valid."
        case .decodingJsonData:
            "Check if the content of the file is valid json."
        case .encodingJsonData:
            "Check if the content of the file is valid json."
        }
    }
}
