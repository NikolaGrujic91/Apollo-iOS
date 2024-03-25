//
//  Plan.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public final class Plan: Codable, Identifiable {
    // MARK: - Properties

    public let id = UUID()
    public var name: PlanType = .basic0to2K
    public var weeks: [Week] = []

    // MARK: - Initializers

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case weeks
    }
}

// MARK: - Hashable

extension Plan: Hashable {
    public static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
