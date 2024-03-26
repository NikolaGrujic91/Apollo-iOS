//
//  Week.swift
//  FoundationData
//
//  Created by Nikola Grujic on 04/03/2023.
//

import Foundation
import FoundationLocalization

final class Week: Codable, Identifiable {
    // MARK: - Properties

    public let id = UUID()
    public private(set) var name: String = ""
    public private(set) var orderNumber: String = ""
    public private(set) var days: [Day] = []

    private enum CodingKeys: CodingKey {
        case name
        case orderNumber
        case days
    }

    // MARK: - Functions

    @MainActor
    func fullName(_ language: LanguageCode) -> String {
        "\(name.localized(language)) \(orderNumber)"
    }
}

// MARK: - Hashable

extension Week: Hashable {
    public static func == (lhs: Week, rhs: Week) -> Bool {
        lhs.id == rhs.id
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
