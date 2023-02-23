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

public extension LoggerInjected {
    var logger: LoggerProtocol {
        LoggerInjectionMap.logger
    }
}
