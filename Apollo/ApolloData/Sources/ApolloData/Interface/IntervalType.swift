//
//  IntervalType.swift
//  ApolloData
//
//  Created by Nikola Grujic on 08/03/2023.
//

import Foundation
import SwiftUI

public enum IntervalType: String, CaseIterable, Codable {
    case run      = "run"
    case walk     = "walk"
    case fastRun  = "fast run"
    case fastWalk = "fast walk"
}

extension IntervalType {
    func color() -> Color {
        switch self {
        case .run:
            return Color.blue
        case .walk:
            return Color.green
        case .fastRun:
            return Color.yellow
        case .fastWalk:
            return Color.red
        }
    }
}
