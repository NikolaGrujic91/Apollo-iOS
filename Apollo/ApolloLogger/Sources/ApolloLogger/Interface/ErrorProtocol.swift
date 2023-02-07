//
//  ErrorProtocol.swift
//  ApolloLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation

public protocol ErrorProtocol: LocalizedError {
    var errorLine: ErrorLine { get set }
}
