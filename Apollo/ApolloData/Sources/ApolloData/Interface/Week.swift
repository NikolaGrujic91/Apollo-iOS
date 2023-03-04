//
//  Week.swift
//  ApolloData
//
//  Created by Nikola Grujic on 04/03/2023.
//

import Foundation

public final class Week: Codable, Identifiable {
    public let id = UUID()
    public var name: String = ""
    public var days: [Day] = []

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case days
    }
}

extension Week: Hashable {
    public static func == (lhs: Week, rhs: Week) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
