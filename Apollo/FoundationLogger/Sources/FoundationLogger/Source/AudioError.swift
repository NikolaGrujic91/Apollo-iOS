//
//  AudioError.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

@MainActor
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

@MainActor
extension AudioError: ErrorProtocol {
    public var errorDescription: String? {
        switch errorType {
        case .soundNotFound:
            "Requested sound not found."
        case .failedToLoadSound:
            "Failed to load sound in the player."
        }
    }

    public var failureReason: String? {
        switch errorType {
        case .soundNotFound:
            "Can not find requested sound in Resources."
        case .failedToLoadSound:
            "Can not load sound in the player."
        }
    }

    public var recoverySuggestion: String? {
        switch errorType {
        case .soundNotFound:
            "Check if requested sound is present in Resources."
        case .failedToLoadSound:
            "Check if sound file is corrupted."
        }
    }
}
