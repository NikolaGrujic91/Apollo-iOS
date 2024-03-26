//
//  Interval.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

final class Interval: Codable, Identifiable {
    // MARK: - Properties

    let id = UUID()
    var type: IntervalType = .run
    var seconds: Int = 0
    var startFraction: CGFloat = 0
    var endFraction: CGFloat = 0

    private enum CodingKeys: CodingKey {
        case type
        case seconds
    }
}

// MARK: - Equatable

extension Interval: Equatable {
    static func == (lhs: Interval, rhs: Interval) -> Bool {
        lhs.id == rhs.id
    }
}
