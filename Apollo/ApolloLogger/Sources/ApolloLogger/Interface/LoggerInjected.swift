//
//  LoggerInjected.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

enum LoggerInjectionMap {
    static var logger: LoggerProtocol = Logger()
}

public protocol LoggerInjected {}

extension LoggerInjected {
    public var logger: LoggerProtocol {
        return LoggerInjectionMap.logger
    }
}
