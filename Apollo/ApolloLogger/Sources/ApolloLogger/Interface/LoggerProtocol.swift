//
//  LoggerProtocol.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

public protocol LoggerProtocol {
    func handleError(_ error: Error)

    func handleError(_ error: ErrorProtocol)

    func logInfo(_ message: String)

    func logWarn(_ message: String)
}