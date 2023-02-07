//
//  Logger.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

import CocoaLumberjackSwift

class Logger: LoggerProtocol {
    init() {
        // Configure CocoaLumberjack to print messages in Xcode console
        DDLog.add(DDOSLogger.sharedInstance)
    }

    // MARK: - LoggerProtocol

    public func handleError(_ error: Error) {
        DDLogError(error.localizedDescription)
    }

    public func handleError(_ error: ErrorProtocol) {
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

        DDLogError(message)
    }

    public func logInfo(_ message: String) {
        DDLogInfo(message)
    }

    public func logWarn(_ message: String) {
        DDLogWarn(message)
    }
}
