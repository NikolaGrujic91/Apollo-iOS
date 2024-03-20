//
//  LoggerInjected.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

@MainActor
enum LoggerInjectionMap {
    static var logger: LoggerProtocol = Logger()
}

public protocol LoggerInjected {}

@MainActor
public extension LoggerInjected {
    var logger: LoggerProtocol {
        LoggerInjectionMap.logger
    }
}
