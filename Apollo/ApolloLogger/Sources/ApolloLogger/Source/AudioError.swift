//
//  AudioError.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public final class AudioError: Error {
    public enum AudioErrorType {
        case soundNotFound
        case failedToLoadSound
    }

    let errorType: AudioErrorType

    public init(_ errorType: AudioErrorType, _ errorLine: ErrorLine) {
        self.errorType = errorType
        self.errorLine = errorLine
    }

    // MARK: - ErrorProtocol

    public var errorLine: ErrorLine
}

extension AudioError: ErrorProtocol {
    public var errorDescription: String? {
        switch errorType {
        case .soundNotFound:
            return "Requested sound not found."
        case .failedToLoadSound:
            return "Failed to load sound in the player."
        }
    }

    public var failureReason: String? {
        switch errorType {
        case .soundNotFound:
            return "Can not find requested sound in Resources."
        case .failedToLoadSound:
            return "Can not load sound in the player."
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case .soundNotFound:
            return "Check if requested sound is present in Resources."
        case .failedToLoadSound:
            return "Check if sound file is corrupted."
        }
    }
}
