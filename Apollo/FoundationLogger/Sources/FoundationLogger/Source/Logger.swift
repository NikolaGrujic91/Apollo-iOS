//
//  Logger.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

import CocoaLumberjackSwift

final class Logger: LoggerProtocol {
    #if DEBUG
        private let logLevel: DDLogLevel = .verbose
    #else
        private let logLevel: DDLogLevel = .error
    #endif

    init() {
        // Configure CocoaLumberjack to print messages in Xcode console
        DDLog.add(DDOSLogger.sharedInstance, with: logLevel)
    }

    // MARK: - LoggerProtocol

    func handleError(_ error: Error) {
        DDLogError(DDLogMessageFormat(stringLiteral: error.localizedDescription))
    }

    func handleError(_ error: ErrorProtocol) {
        var message = ""

        message.append("\n\tError: \(error.errorLine.description)\n")

        if let errorDescription = error.errorDescription {
            message.append("\tError Description: \(errorDescription)\n")
        }

        if let failureReason = error.failureReason {
            message.append("\tFailure Reason: \(failureReason)\n")
        }

        if let recoverySuggestion = error.recoverySuggestion {
            message.append("\tRecovery Suggestion: \(recoverySuggestion)")
        }

        DDLogError(DDLogMessageFormat(stringLiteral: message))
    }

    func logInfo(_ message: String) {
        DDLogInfo(DDLogMessageFormat(stringLiteral: message))
    }

    func logWarn(_ message: String) {
        DDLogWarn(DDLogMessageFormat(stringLiteral: message))
    }
}
