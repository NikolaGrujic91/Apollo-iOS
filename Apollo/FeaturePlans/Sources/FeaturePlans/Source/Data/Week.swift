//
//  Week.swift
//  FoundationData
//
//  Created by Nikola Grujic on 04/03/2023.
//

import Foundation

public final class Week: Codable, Identifiable {
    // MARK: - Properties

    public let id = UUID()
    public var name: String = ""
    public var days: [Day] = []

    // MARK: - Initializers

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case days
    }
}

// MARK: - Hashable

extension Week: Hashable {
    public static func == (lhs: Week, rhs: Week) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
