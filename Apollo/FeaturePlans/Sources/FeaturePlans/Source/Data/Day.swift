//
//  Day.swift
//  FoundationData
//
//  Created by Nikola Grujic on 11/02/2023.
//

import Foundation
import FoundationLocalization

final class Day: Codable, Identifiable {
    // MARK: - Properties

    var finished = false
    var fractionsCalculated = false
    var calories: Int = 0
    var distance: String = ""
    var intervals: [Interval] = []
    var name: String = ""
    var orderNumber: String = ""
    var pace: String = ""
    let id = UUID()

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

    func calculateFractions() {
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

    func totalTime() -> Int {
        intervals.reduce(0) { $0 + $1.seconds }
    }

    func intervalType(_ index: Int) -> IntervalType {
        intervals.isEmpty ? .run : intervals[index].type
    }

    @MainActor
    func fullName(_ language: LanguageCode) -> String {
        "\(name.localized(language)) \(orderNumber)"
    }
}

// MARK: - Hashable

extension Day: Hashable {
    static func == (lhs: Day, rhs: Day) -> Bool {
        lhs.id == rhs.id
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
