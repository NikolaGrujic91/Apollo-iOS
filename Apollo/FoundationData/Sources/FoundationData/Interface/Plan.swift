//
//  Plan.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public final class Plan: Codable, Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var weeks: [Week] = []

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case weeks
    }
}

extension Plan: Hashable {
    public static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
