//
//  Day.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation
import FoundationLocalization

public final class Day: Codable, Identifiable {
    // MARK: - Properties

    public var finished = false
    public var fractionsCalculated = false
    public var calories: Int = 0
    public var distance: Int = 0
    public var intervals: [Interval] = []
    public var name: String = ""
    public var orderNumber: String = ""
    public var pace: String = ""
    public let id = UUID()

    // MARK: - Initializers

    public init() {}

    private enum CodingKeys: CodingKey {
        case name
        case orderNumber
        case calories
        case distance
        case pace
        case finished
        case intervals
    }

    // MARK: - Functions

    public func calculateFractions() {
        if fractionsCalculated {
            return
        }

        let totalTime = CGFloat(totalTime())
        var remainingFraction: CGFloat = 1.0
        var fractionDuration: CGFloat = 0.0
        var startFraction: CGFloat = 0.0
        var endFraction: CGFloat = 0.0

        intervals.forEach {
            fractionDuration = ((CGFloat($0.seconds) * 100.0) / totalTime) / 100.0
            startFraction = remainingFraction
            remainingFraction -= fractionDuration
            endFraction = $0 == intervals.last ? 0.0 : remainingFraction

            $0.startFraction = startFraction
            $0.endFraction = endFraction
        }

        fractionsCalculated = true
    }

    public func totalTime() -> Int {
        intervals.reduce(0) { $0 + $1.seconds }
    }

    public func intervalType(_ index: Int) -> IntervalType {
        intervals.isEmpty ? .run : intervals[index].type
    }

    @MainActor
    public func fullName(_ language: LanguageCode) -> String {
        "\(name.localized(language)) \(orderNumber)"
    }
}

// MARK: - Hashable

extension Day: Hashable {
    public static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
