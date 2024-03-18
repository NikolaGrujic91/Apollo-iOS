//
//  Interval.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation

public final class Interval: Codable, Identifiable {
    // MARK: - Properties

    public let id = UUID()
    public var type: IntervalType = .run
    public var seconds: Int = 0
    public var startFraction: CGFloat = 0
    public var endFraction: CGFloat = 0

    // MARK: - Initializers

    public init() {}

    private enum CodingKeys: CodingKey {
        case type
        case seconds
    }
}

// MARK: - Equatable

extension Interval: Equatable {
    public static func == (lhs: Interval, rhs: Interval) -> Bool {
        lhs.id == rhs.id
    }
}
