//
//  Plan.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

final class Plan: Codable, Identifiable {
    // MARK: - Properties

    let id = UUID()
    var name: PlanType = .basic0to2K
    var weeks: [Week] = []

    private enum CodingKeys: CodingKey {
        case name
        case weeks
    }
}

// MARK: - Hashable

extension Plan: Hashable {
    static func == (lhs: Plan, rhs: Plan) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
