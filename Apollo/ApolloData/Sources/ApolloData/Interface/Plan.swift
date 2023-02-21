//
//  Plan.swift
//  ApolloData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public final class Plan: Codable, Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var days: [Day] = []

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case days
    }
}

extension Plan: Hashable {
    public static func == (lhs: Plan, rhs: Plan) -> Bool {
        return lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
