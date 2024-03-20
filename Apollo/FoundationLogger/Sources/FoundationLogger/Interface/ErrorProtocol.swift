//
//  ErrorProtocol.swift
//  FoundationLogger
//
//  Created by Nikola Grujic on 07/02/2023.
//

import Foundation

@MainActor
public protocol ErrorProtocol: LocalizedError, AnyObject {
    var errorLine: ErrorLine { get set }
}
