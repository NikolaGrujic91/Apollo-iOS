//
//  Day.swift
//  ApolloData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public final class Day: Codable, Identifiable {
    public var finished = false
    public var calories: Int = 0
    public var distance: Int = 0
    public var intervals: [Interval] = []
    public var name: String = ""
    public var pace: String = ""
    public let id = UUID()

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case calories
        case distance
        case pace
        case finished
        case intervals
    }
}

extension Day: Hashable {
    public static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
